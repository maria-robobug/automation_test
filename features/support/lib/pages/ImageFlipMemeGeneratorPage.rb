require './features/support/lib/utils/validation_util.rb'

class ImageFlipMemeGeneratorPage
  extend ValidationUtil

  attr_accessor(:browser, :top_text, :bottom_text, :generate_meme_button, :lightbox, :lightbox_image_html, :lightbox_loaded,
                :go_to_image_page_button, :image_link, :image_link_url)

  URL = 'https://imgflip.com/memegenerator'

  def initialize(browser)
    @browser = browser
    @top_text = @browser.textarea(:class => 'mm-text', :placeholder => /top text/i)
    @bottom_text = @browser.textarea(:class => 'mm-text', :placeholder => /bottom text/i)
    @generate_meme_button = @browser.div(:class => 'mm-generate b but')

    @lightbox = @browser.div(:id => 'done').img(:id => 'doneImage')
    @lightbox_loaded = @browser.div(:id => 'doneShare')
    @lightbox_image_html = @browser.div(:id => 'doneUrl').input(:class => 'img-code html')

    @go_to_image_page_button = @browser.div(:id => 'doneLinks').link(:text => /go to image page/i)
    @image_link = @browser.div(:id => 'doneUrl').input(:class => 'img-code html')

    @image_link_url = @browser.element(:xpath => '//*[@id="doneUrl"]/div[1]/input')
  end

  def visit_page
    @browser.goto(URL)
  end

  def click_go_to_image_page
    @go_to_image_page_button.when_present.click

    return @image_link_url
  end

  def generate_meme(top_text, bottom_text, meme_type)
    select_meme_type meme_type
    set_meme_text top_text, bottom_text
    click_generate_meme_button
  end

  def lightbox_displayed?
    if @lightbox.exists?
      @lightbox_loaded.wait_until_present(DEFAULT_WAIT_TIMEOUT)
    end

    ValidationUtil.valid_html(@lightbox_image_html.html)
  end

  #private
  def select_meme_type(meme_type)
    meme_type_image = @browser.div(:class => 'im', :title => /#{meme_type}/)
    meme_type_image.when_present.click
  end

  def click_generate_meme_button
    @generate_meme_button.when_present.click
  end

  def set_meme_text(top_text, bottom_text)
    @top_text.set top_text
    @bottom_text.set bottom_text
  end

end
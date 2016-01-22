class ImageFlipHomePage

  attr_accessor(:browser, :make_a_meme_link)

  URL = 'https://imgflip.com/'

  def initialize(browser)
    @browser = browser
    @make_a_meme_link = @browser.link(:class => 'go-create')
  end

  def visit_page
    @browser.goto(URL)
  end

  def click_make_a_meme()
    make_a_meme_link.when_present.click
  end
end
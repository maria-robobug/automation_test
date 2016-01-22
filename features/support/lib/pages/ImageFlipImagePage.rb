class ImageFlipImagePage
  attr_accessor(:browser, :url, :page_title, :descriptions)

  def initialize(browser)
    @browser = browser
    @page_title = @browser.div(:id => 'img-main')
    @descriptions = @browser.elements(:xpath => '//*[@id="fPanel"]/div[4]/div[5]')
  end

  def verify_page(url)
    @browser.current_url.includes(url)
  end

  def title_shown?(meme_type)
    @page_title.present?
    @page_title.text.include?(meme_type)
  end

  def descriptions_shown?(top_text, bottom_text)
    expected_text = "#{top_text} #{bottom_text}".upcase
    @descriptions = @descriptions.map.each { |desc| desc.text }

    @descriptions.first.include?(expected_text)
  end
end
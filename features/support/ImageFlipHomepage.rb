require 'page-object'

class ImageFlipHomepage
  include PageObject

  PAGE_URL = 'https://imgflip.com/'

  link(:meme_top, :class => 'go-create')

  def initialize(browser)
    @browser = browser
  end

  def visit_page()
    @browser.goto(PAGE_URL)
  end

  def create_meme()
    link
  end

end
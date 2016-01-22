require 'watir-webdriver'
require 'nokogiri'

DEFAULT_WAIT_TIMEOUT = 15

def create_page(page_name, browser)
  page_name.gsub!(" ", "")
  new_page = Kernel.const_get("#{page_name}Page").new browser

  return new_page
end
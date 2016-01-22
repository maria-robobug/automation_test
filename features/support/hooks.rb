Before do
  @browser = Watir::Browser.new :ff
end

After do
  @browser.close
end
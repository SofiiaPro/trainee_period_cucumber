require 'watir'
Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize

  # wait = Selenium::WebDriver::Wait.new(:timeout => 15)

end
After do
  @browser.close
end

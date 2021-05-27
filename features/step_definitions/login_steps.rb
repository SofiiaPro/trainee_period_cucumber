require_relative '../../pages/login_page'

Given(/^A user is on the login page$/) do
  @login_page = Login_Page.new(@browser)
  @login_page.navigate_to_login_page
end
And(/^A user fills in Username with "([^"]*)"$/) do |arg|
  @login_page.enter_username(arg.to_s)
end

And(/^A user fills in Password with "([^"]*)"$/) do |arg|
  @login_page.enter_password(arg.to_s)
end

And(/^A user chooses Outpatient Clinic location for the session$/) do
  @login_page.choose_location
end

When(/^A user presses Login in button$/) do
  @login_page.click_on_login_button
end

Then(/^A user should be on the users home page and see "([^"]*)"$/) do |arg|
  @login_page.verify_home_page_header(arg.to_s)
end
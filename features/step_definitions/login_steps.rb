require_relative '../../pages/login_page'

Given(/^A user is on the login page$/) do
  @login_page = LoginPage.new(@browser)
  @login_page.navigate_to_login_page
end
And(/^A user fills in Username with "([^"]*)"$/) do |username|
  @login_page.enter_username(username)
end

And(/^A user fills in Password with "([^"]*)"$/) do |password|
  @login_page.enter_password(password)
end

And(/^A user chooses Outpatient Clinic location for the session$/) do
  @login_page.choose_location
end

When(/^A user presses Login in button$/) do
  @login_page.click_on_login_button
end

Then(/^A user should be on the users home page and see "([^"]*)"$/) do |message|
  @login_page.compare_home_page_headers(message)
end

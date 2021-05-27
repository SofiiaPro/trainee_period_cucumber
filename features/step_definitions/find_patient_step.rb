require_relative '../../pages/home_page'
require_relative '../../pages/find_patient_page'

Given(/^a user on the home page and want to find patient$/) do
  @home_page = Home_Page.new(@browser)
end

And(/^a user navigate to Find Patient Record$/) do
  @home_page.navigate_to_find_patient_page
end

And(/^a user fill Search Field with "([^"]*)"$/) do |arg|
  @find_patient_page = Find_Patient_Page.new(@browser)
  @find_patient_page.enter_patient_name(arg.to_s)
end

And(/^a user verify that table contains required columns "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" "([^"]*)"$/) do
|arg1, arg2, arg3, arg4, arg5|
  @find_patient_page.check_required_columns (arg1.to_s), (arg2.to_s), (arg3.to_s), (arg4.to_s), ("#{arg5})")
end

When(/^a user verify that columns are not empty$/) do
  @find_patient_page.check_columns_filling
  expect(true).to be true
end

Then(/^a user should see patient "([^"]*)" in patient record$/) do |arg|
  @find_patient_page.check_record_patient_information(arg.to_s)
  expect(true).to be true
end

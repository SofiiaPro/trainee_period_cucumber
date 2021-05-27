require_relative '../../pages/home_page'
require_relative '../../pages/find_patient_page'

Given(/^a user is on the home page and wants to find patient$/) do
  @home_page = HomePage.new(@browser)
end

And(/^a user navigates to Find Patient Record$/) do
  @home_page.navigate_to_find_patient_page
end

And(/^a user fills Search Field with (.*)$/) do |name|
  @find_patient_page = FindPatientPage.new(@browser)
  @find_patient_page.enter_patient_name(name.to_s)
end

And(/^verify that table contains required columns "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" "([^"]*)"$/) do
|arg1, arg2, arg3, arg4, arg5|
  @find_patient_page.check_required_columns (arg1.to_s), (arg2.to_s), (arg3.to_s), (arg4.to_s), ("#{arg5})")
end

When(/^verify that columns are not empty$/) do
  expect(@find_patient_page.check_columns_filling).to be true
end

Then(/^a user should see patient (.*) in patient record$/) do |name|
  expect(@find_patient_page.check_record_patient_information(name.to_s)).to be true
end

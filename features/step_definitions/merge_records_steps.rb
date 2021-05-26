require_relative '../../pages/home_page'
require_relative '../../pages/data_management_page'
require_relative '../../pages/merge_patient_records_page'

Given(/^A user on the home page and want to merge patient's record$/) do
  @Home_page = Home_Page.new(@browser)
end

And(/^A user navigate to Data Management page$/) do
  @Home_page.navigate_to_data_management_page
end

And(/^A user navigate to Merge Patient Electronic Records$/) do
  @Data_management_page = Data_Management_Page.new(@browser)
  @Data_management_page.navigate_to_merge_patient_records
end

And(/^A user fill in first person id field with "([^"]*)"$/) do |arg|
  @Merge_Patient_Record_Page = Merge_Patient_Record_Page.new(@browser)
  @Merge_Patient_Record_Page.enter_first_patient_id(arg.to_s)
end

And(/^A user fill in second person id field with "([^"]*)"$/) do |arg|
  @Merge_Patient_Record_Page.enter_second_patient_id(arg.to_s)
end

And(/^A user press Continue button$/) do
  @Merge_Patient_Record_Page.press_continue_button
end

And(/^A user select the preferred record by click on the second patient data$/) do
  @Merge_Patient_Record_Page.merge_records_by_first_patient
end

When(/^A user press continue button$/) do
  @Merge_Patient_Record_Page.press_confirm_button
end

Then(/^A user should see two patients id: "([^"]*)" and "([^"]*)" at the page$/) do |arg1, arg2|
  @Merge_Patient_Record_Page.check_page_ids(arg1.to_s, arg2.to_s)
  expect(true).to be true
end

require_relative '../../pages/home_page'
require_relative '../../pages/data_management_page'
require_relative '../../pages/merge_patient_records_page'

Given(/^a user is on the home page and wants to merge patient's record$/) do
  @home_page = HomePage.new(@browser)
end

And(/^a user navigates to the Data Management page$/) do
  @home_page.navigate_to_data_management_page
end

And(/^a user navigates to the Merge Patient Electronic Records$/) do
  @data_management_page = DataManagementPage.new(@browser)
  @data_management_page.navigate_to_merge_patient_records
end

And(/^a user enters persons' ids (.*) (.*)$/) do |first_person_id, second_person_id|
  @merge_patient_record_page = MergePatientRecordPage.new(@browser)
  @merge_patient_record_page.enter_first_patient_id(first_person_id.to_s)
  @merge_patient_record_page.enter_second_patient_id(second_person_id.to_s)
end

And(/^a user presses Continue button$/) do
  @merge_patient_record_page.press_continue_button
end

And(/^a user selects the preferred record by click on the second patient data$/) do
  @merge_patient_record_page.merge_records_by_first_patient
end

When(/^a user presses continue button$/) do
  @merge_patient_record_page.press_confirm_button
end

Then(/^a user should see two patients id: (.*) and (.*) at the page$/) do |first_person_id, second_person_id|
  expect(@merge_patient_record_page.compare_page_ids_with_expected_ids(first_person_id.to_s, second_person_id.to_s)).to
  be true
end

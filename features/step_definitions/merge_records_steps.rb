require_relative '../../pages/home_page'
require_relative '../../pages/data_management_page'

Given (/^user on the home page$/) do
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
  pending
end

And(/^A user fill in second person id field with "([^"]*)"$/) do |arg|
  pending
end

And(/^A user press Merge button$/) do
  pending
end

And(/^A user select the preferred record by click on the second patient data$/) do
  pending
end

When(/^A user press continue button$/) do
  pending
end

Then(/^A user should see two patient id at the page$/) do
  pending
end

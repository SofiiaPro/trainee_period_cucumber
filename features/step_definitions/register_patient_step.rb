require_relative '../../pages/home_page'
require_relative '../../pages/register_patient_page'

Given(/^A user on home page$/) do
  @Home_page = Home_Page.new(@browser)
end

And(/^A user navigate to Register a Patient page$/) do
  @Home_page.navigate_to_register_patient_page
  @Register_patient_page = Register_Patient_Page.new(@browser)
end

And(/^A user determine Demography by filling Name Field with "([^"]*)"$/) do |arg|
  # @Register_patient_page.click_checkbox
  @Register_patient_page.enter_patient_first_name(arg.to_s)
end

And(/^A user fill Surname Field with "([^"]*)" and press Enter$/) do |arg|
  @Register_patient_page.enter_patient_surname(arg.to_s)
  @Register_patient_page.press_next_button
end

And(/^A user choose gender of patient, click on male and press Enter$/) do
  @Register_patient_page.choose_patient_gender
  @Register_patient_page.press_next_button
end

And(/^A user fill Estimated years Field with "([^"]*)" and press Enter$/) do |arg|
  @Register_patient_page.enter_estimated_years(arg.to_s)
  @Register_patient_page.press_next_button
end

And(/^A user fill Address Field with "([^"]*)"$/) do |arg|
  @Register_patient_page.enter_address_name(arg.to_s)
end

And(/^A user fill City or Village Field with "([^"]*)"$/) do |arg|
  @Register_patient_page.enter_city_name(arg.to_s)
end

And(/^A user fill State Field with "([^"]*)"$/) do |arg|
  @Register_patient_page.enter_state_name(arg.to_s)

end

And(/^A user fill Country Field with "([^"]*)"$/) do |arg|
  @Register_patient_page.enter_country_name(arg.to_s)
end

And(/^A user fill Postal Code Field with "([^"]*)"$/) do |arg|
  @Register_patient_page.enter_postal_code(arg.to_s)
  @Register_patient_page.press_next_button
end

And(/^A user fill Patient Phone Number Field with "([^"]*)" and press Enter$/) do |arg|
  @Register_patient_page.enter_phone_number(arg.to_s)
  @Register_patient_page.press_next_button
end

And(/^A user choose Patient Relationship with "([^"]*)"$/) do |arg|
  @Register_patient_page.choose_patient_relationship_type(arg.to_s)
end

And(/^A user fill Name of Individual Field with "([^"]*)" and press Enter$/) do |arg|
  @Register_patient_page.enter_relative_person_name(arg.to_s)
  @Register_patient_page.press_next_button
end

When(/^A user confirm shipment by pressing "([^"]*)"$/) do |arg|
  @Register_patient_page.press_confirm_button
end

Then(/^A user should see patient name "([^"]*)" and surname "([^"]*)" in register$/) do |arg1, arg2|
  @Register_patient_page.check_register_patient_information(arg1.to_s, arg2.to_s)
  expect(true).to be true
end

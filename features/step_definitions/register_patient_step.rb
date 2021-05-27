require_relative '../../pages/home_page'
require_relative '../../pages/register_patient_page'

Given(/^a user on the home page and wants to register a new patient$/) do
  @home_page = Home_Page.new(@browser)
end

And(/^a user navigate to Register a Patient page$/) do
  @home_page.navigate_to_register_patient_page
  @register_patient_page = Register_Patient_Page.new(@browser)
end

And(/^a user determines Patient Demographics  with (.*) (.*) (.*)$/) do |arg1, arg2, arg3|
  @register_patient_page.enter_patient_first_name(arg1.to_s)
  @register_patient_page.enter_patient_surname(arg2.to_s)
  @register_patient_page.press_next_button
  @register_patient_page.choose_patient_gender
  @register_patient_page.press_next_button
  @register_patient_page.enter_estimated_years(arg3.to_s)
  @register_patient_page.press_next_button
end

And(/^a user determines Patient Contact info with (.*) (.*) (.*) (.*) (.*)$/) do |arg1, arg2, arg3, arg4, arg5|
  @register_patient_page.enter_address_name(arg1.to_s)
  @register_patient_page.enter_city_name(arg2.to_s)
  @register_patient_page.enter_state_name(arg3.to_s)
  @register_patient_page.enter_country_name(arg4.to_s)
  @register_patient_page.enter_postal_code(arg5.to_s)
  @register_patient_page.press_next_button
end

And(/^a user determines Patient Phone Number with (.*)$/) do |arg|
  @register_patient_page.enter_phone_number(arg.to_s)
  @register_patient_page.press_next_button
end


And(/^a user determines Patient Relatives with (.*) (.*)$/) do |relationship_type, relative_person_name|
  @register_patient_page.choose_patient_relationship_type(relationship_type.to_s)
  @register_patient_page.enter_relative_person_name(relative_person_name.to_s)
  @register_patient_page.press_next_button
end

When(/^a user confirms shipment by pressing Confirm button$/) do
  @register_patient_page.press_confirm_button
end

Then(/^a user should see patient name (.*) and surname (.*) in register$/) do |arg1, arg2 |
  @register_patient_page.check_register_patient_information(arg1.to_s, arg2.to_s)
  expect(true).to be true
end


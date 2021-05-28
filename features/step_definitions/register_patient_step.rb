require_relative '../../pages/home_page'
require_relative '../../pages/register_patient_page'

Given(/^a user on the home page and wants to register a new patient$/) do
  @home_page = HomePage.new(@browser)
end

And(/^a user navigates to Register a Patient page$/) do
  @home_page.navigate_to_register_patient_page
  @register_patient_page = RegisterPatientPage.new(@browser)
end

And(/^a user enters Patient Demographics  with (.*) (.*) (.*)$/) do |name, surname, years|
  @register_patient_page.enter_patient_first_name(name)
  @register_patient_page.enter_patient_surname(surname)
  @register_patient_page.press_next_button
  @register_patient_page.choose_patient_gender
  @register_patient_page.press_next_button
  @register_patient_page.enter_estimated_years(years)
  @register_patient_page.press_next_button
end

And(/^a user enters Patient Contact info with (.*) (.*) (.*) (.*) (.*)$/) do |address, city, state, country,
  postal_code|
  @register_patient_page.enter_address_name(address)
  @register_patient_page.enter_city_name(city)
  @register_patient_page.enter_state_name(state)
  @register_patient_page.enter_country_name(country)
  @register_patient_page.enter_postal_code(postal_code)
  @register_patient_page.press_next_button
end

And(/^a user enters Patient Phone Number with (.*)$/) do |phone_number|
  @register_patient_page.enter_phone_number(phone_number)
  @register_patient_page.press_next_button
end

And(/^a user enters Patient Relatives with (.*) (.*)$/) do |relationship_type, relative_person_name|
  @register_patient_page.choose_patient_relationship_type(relationship_type)
  @register_patient_page.enter_relative_person_name(relative_person_name)
  @register_patient_page.press_next_button
end

When(/^a user confirms shipment by pressing Confirm button$/) do
  @register_patient_page.press_confirm_button
end

Then(/^a user should see patient name (.*) and surname (.*) in register$/) do |name, surname|
  expect(@browser.text.include?(name)).to be true
  expect(@browser.text.include?(surname)).to be true
end


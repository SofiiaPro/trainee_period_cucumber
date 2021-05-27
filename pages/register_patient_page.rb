class RegisterPatientPage

  def initialize(browser)
    @browser = browser
  end

  def get_name_field
    @browser.text_field(name: "givenName")
  end

  def get_surname_field
    @browser.text_field(name: "familyName")
  end

  def get_gender_field
    @browser.element(xpath: "//select//option[@value = 'M']")
  end

  def get_estimated_years_field
    @browser.text_field(id: "birthdateYears-field")
  end

  def get_address_field
    @address_field = @browser.text_field(id: "address1")
  end

  def get_city_field
    @browser.text_field(id: "cityVillage")
  end

  def get_state_field
    @browser.text_field(id: "stateProvince")
  end

  def get_country_field
    @browser.text_field(id: "country")
  end

  def get_postal_code
    @browser.text_field(id: "postalCode")
  end

  def get_phone_number
    @browser.text_field(name: "phoneNumber")
  end

  def get_relationship_type_field
    @browser.select(id: "relationship_type")
  end

  def get_relative_person_name_field
    @browser.text_field(class: "person-typeahead ng-pristine ng-untouched ng-valid ng-empty")
  end

  def get_confirm_button
    @confirm_button = @browser.element(id: "submit")
  end

  def get_next_button
    @browser.element(id: "next-button")
  end

  def get_patient_name_in_register
    @browser.element(class: "PersonName-givenName")
  end

  def get_patient_surname_in_register
    @browser.element(class: "PersonName-familyName")
  end

  def enter_patient_first_name(arg)
    name_field = get_name_field
    name_field.set arg
  end

  def enter_patient_surname(arg)
    surname_field = get_surname_field
    surname_field.set arg
  end

  def choose_patient_gender
    gender_field = get_gender_field
    gender_field.click
  end

  def enter_estimated_years(arg)
    estimated_years_field = get_estimated_years_field
    estimated_years_field.set arg
  end

  def enter_address_name(arg)
    address_field = get_address_field
    address_field.set arg
  end

  def enter_city_name(arg)
    city_field = get_city_field
    city_field.set arg
  end

  def enter_state_name(arg)
    state_field = get_state_field
    state_field.set arg
  end

  def enter_country_name(arg)
    country_field = get_country_field
    country_field.set arg
  end

  def enter_postal_code(arg)
    postal_code_field = get_postal_code
    postal_code_field.set arg
  end

  def enter_phone_number(arg)
    phone_number_field = get_phone_number
    phone_number_field.set arg
  end

  def choose_patient_relationship_type(arg)
    relationship_type_field = get_relationship_type_field
    relationship_type_field.click
    chosen_relationship_type = @browser.option(xpath: "//select//option[contains(text(), #{arg})]")
  end

  def enter_relative_person_name(arg)
    relative_person_name_field = get_relative_person_name_field
    relative_person_name_field.set arg
  end

  def press_confirm_button
    confirm_button = get_confirm_button
    confirm_button.click
  end

  def check_register_patient_information(arg1, arg2)
    patient_name_in_register = get_patient_name_in_register
    patient_surname_in_register = get_patient_surname_in_register
    true if patient_name_in_register == arg1 && patient_surname_in_register == arg2
  end

  def press_next_button
    next_button = get_next_button
    next_button.click
  end
end

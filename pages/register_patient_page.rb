class Register_Patient_Page
  attr_accessor :name_field, :surname_field, :gender_field, :estimated_years_field, :address_field,
                :city_field, :state_field, :country_field, :postal_code_field, :phone_number_field,
                :relationship_type_field, :relative_person_name_field, :confirm_button, :next_button,
                :patient_name_in_register, :patient_surname_in_register

  def initialize(browser)
    @browser = browser
    @name_field = @browser.text_field(name: "givenName")
    @surname_field = @browser.text_field(name: "familyName")
    @gender_field = @browser.element(xpath: "//select//option[@value = 'M']")
    @estimated_years_field = @browser.text_field(id: "birthdateYears-field")
    @address_field = @browser.text_field(id: "address1")
    @city_field = @browser.text_field(id: "cityVillage")
    @state_field = @browser.text_field(id: "stateProvince")
    @country_field = @browser.text_field(id: "country")
    @postal_code_field = @browser.text_field(id: "postalCode")
    @phone_number_field = @browser.text_field(name: "phoneNumber")
    @relationship_type_field = @browser.select(id: "relationship_type")
    @relative_person_name_field = @browser.text_field(class: "person-typeahead ng-pristine ng-untouched ng-valid ng-empty")
    @confirm_button = @browser.element(id: "submit")
    @next_button = @browser.element(id: "next-button")
    @patient_name_in_register = @browser.element(class: "PersonName-givenName")
    @patient_surname_in_register = @browser.element(xpath: "PersonName-familyName")
  end

  def enter_patient_first_name(first_name)
    @name_field.set (first_name)
  end

  def enter_patient_surname(surname)
    @surname_field.set(surname)
  end

  def choose_patient_gender
    @gender_field.click
  end

  def enter_estimated_years(estimated_years)
    @estimated_years_field.set (estimated_years)
  end

  def enter_address_name(address_field)
    @address_field.set address_field
  end

  def enter_city_name(city_name)
    @city_field.set city_name
  end

  def enter_state_name(state_name)
    @state_field.set state_name
  end

  def enter_country_name(country_name)
    @country_field.set country_name
  end

  def enter_postal_code(postal_code)
    @postal_code_field.set postal_code
  end

  def enter_phone_number(phone_number)
    @phone_number_field.set phone_number
  end

  def choose_patient_relationship_type(relationship_type)
    @relationship_type_field.click
    chosen_relationship_type = @browser.option(xpath: "//select//option[contains(text(), #{relationship_type})]")
    chosen_relationship_type.click
  end

  def enter_relative_person_name(relative_person_name)
    @relative_person_name_field.set relative_person_name
  end

  def press_confirm_button
    @confirm_button.click
  end

  def check_register_patient_information(patient_name, patient_surname)
    true if @patient_name_in_register == patient_name && @patient_surname_in_register == patient_surname
  end

  def press_next_button
    @next_button.click
  end
end

require 'pry'
class FindPatientPage

  def initialize(browser)
    @browser = browser
  end

  def get_patient_name_field
    @browser.text_field(xpath: "//input[@id='patient-search']")
  end

  def get_identifier_field
    @browser.text_field(text: "Identifier")
  end

  def get_name_field
    @browser.text_field(text: "Name")
  end

  def get_gender_field
    @browser.text_field(text: "Gender")
  end

  def get_age_field
    @browser.text_field(text: "Age")
  end

  def get_birthday_field
    @browser.text_field(text: "Birthdate")
  end

  def get_patient_name_in_record
    @browser.element(xpath: "//td[@xpath='2']")
  end

  def enter_patient_name(arg)
    patient_name_field = get_patient_name_field
    patient_name_field.set arg
  end

  def check_required_columns(arg1, arg2, arg3, arg4, arg5)
    identifier_field = get_identifier_field
    name_field = get_name_field
    gender_field = get_gender_field
    age_field = get_age_field
    birthday_field = get_birthday_field

    true if (identifier_field == arg1) || (name_field == arg2) || (gender_field == arg3) || (age_field == arg4) ||
      (birthday_field == arg5)
  end

  def check_columns_filling
    table = @browser.element(xpath: '//tbody/tr[1]/td')
    true if table.select do |element|
      element.text.length.positive?
    end
  end
end

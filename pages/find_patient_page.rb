class Find_Patient_Page
  attr_accessor :patient_name_field, :identifier_field, :name_field, :gender_field, :age_field, :birthday_field
  :patient_name_in_record

  def initialize(browser)
    @browser = browser
    @patient_name_field = @browser.text_field(xpath: "//input[@id='patient-search']")
    @identifier_field = @browser.text_field(text: "Identifier")
    @name_field = @browser.text_field(text: "Name")
    @gender_field = @browser.text_field(text: "Gender")
    @age_field = @browser.text_field(text: "Age")
    @birthday_field = @browser.text_field(text: "Birthdate")
    @patient_name_in_record = @browser.element(xpath: "//td[@xpath='2']")
  end

  def enter_patient_name(patient_name)
    @patient_name_field.set patient_name
  end

  def check_required_columns(identifier, name, gender, age, birthdate)
    true if @identifier_field == identifier || (@name_field = name || @gender_field == gender || (@age_field = age ||
      (@birthday_field = birthdate)))
  end

  def check_columns_filling
    table = @browser.element(xpath: '//tbody/tr[1]/td')
    table.select do |element|
      true if element != nil
    end
  end

  def check_record_patient_information(patient_name)
    true if @patient_name_in_record == patient_name
    end
end

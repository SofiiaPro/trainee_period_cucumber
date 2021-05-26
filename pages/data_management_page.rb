class Data_Management_Page
  attr_accessor :merge_patient_records_option

  def initialize(browser)
    @browser = browser
    @merge_patient_records_option = @browser.element(xpath: "/html[1]/body[1]/div[1]/div[3]/div[1]/div[1]/a[1]")
  end

  def navigate_to_merge_patient_records
    @merge_patient_records_option.click
  end
end

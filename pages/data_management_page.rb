class Data_Management_Page
  attr_accessor :manage_scheduler_option

  def initialize(browser)
    @browser = browser
    @manage_scheduler_option = @browser.element(text: "Merge Patient Electronic Records")
  end

  def navigate_to_merge_patient_records
    @manage_scheduler_option.click
  end
end

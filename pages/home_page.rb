class HomePage

  def initialize(browser)
    @browser = browser
  end

  def get_find_patient_record
    @browser.element(text: "Find Patient Record")
  end

  def get_active_visits
    @browser.element(text: "Active Visits")
  end

  def get_register_patient
    @browser.element(text: "Register a patient")
  end

  def get_capture_vitals
    @browser.element(text: "Capture Vitals")
  end

  def get_schedule_appointment
    @browser.element(text: "Appointment Scheduling")
  end

  def get_reports
    @browser.element(text: "Reports")
  end

  def get_data_management
    @browser.element(text: "Data Management")
  end

  def get_configure_metadata
    @browser.element(text: "Configure Metadata")
  end

  def get_system_administration
    @browser.element(text: "System Administration")
  end

  def navigate_to_find_patient_page
    find_patient_record = get_find_patient_record
    find_patient_record.click
  end

  def navigate_to_register_patient_page
    register_patient = get_register_patient
    register_patient.click
  end

  def navigate_to_system_administration_page
    system_administration = get_system_administration
    system_administration.click
  end

  def navigate_to_data_management_page
    data_management = get_data_management
    data_management.click
  end
end

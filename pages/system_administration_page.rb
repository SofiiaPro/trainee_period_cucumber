class SystemAdministrationPage

  def initialize(browser)
    @browser = browser
  end

  def get_manage_scheduler_option
    @browser.element(text: "Manage Scheduler")
  end

  def navigate_to_manage_scheduler_page
    @manage_scheduler_option = get_manage_scheduler_option
    @manage_scheduler_option.click
  end
end

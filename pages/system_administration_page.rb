class System_Administration_Page
  attr_accessor :system_administration_option

  def initialize(browser)
    @browser = browser
    @manage_scheduler_option = @browser.element(text: "Manage Scheduler")
  end

  def navigate_to_manage_scheduler_page
    @manage_scheduler_option.click
  end
end

class Manage_Schedule_Page
  attr_accessor :add_tasks_button

  def initialize(browser)
    @browser = browser
    @add_tasks_button = @browser.element(class: "icon-plus")
  end

  def press_add_tasks_button
    @add_tasks_button.click
  end
end

class ManageSchedulePage

  def initialize(browser)
    @browser = browser
  end

  def get_add_task_button
    @browser.element(class: "icon-plus")
  end

  def press_add_tasks_button
    add_tasks_button = get_add_task_button
    add_tasks_button.click
  end
end

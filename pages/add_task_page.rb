class AddTaskPage

  def initialize(browser)
    @browser = browser
  end

  def get_task_name
    @browser.text_field(xpath: "//input[@ng-model = 'taskName']")
  end

  def get_schedule_class
    @browser.select(xpath: "//select[@ng-model='schedulableClass']")
  end

  def get_task_description
    @browser.textarea(xpath: "//textarea[@ng-model = 'description']")
  end

  def get_start_time
    @browser.text_field(xpath: "//input[@ng-model = 'startTimeVal']")
  end

  def get_repeated_interval
    @browser.text_field(xpath: "//input[@ng-model = 'repeatInterval']")
  end

  def get_save_button
    @browser.button(class: "btn btn-secondary ng-binding")
  end

  def get_created_task_message
    @browser.element(xpath: "alert alert-success alert-dismissable ng-scope")
  end

  def enter_task_name(arg)
    task_name = get_task_name
    task_name.set arg
  end

  def choose_schedule_class(arg)
    schedule_class = get_schedule_class
    schedule_class.click
    chosen_schedule_class = @browser.option(xpath: "//option[contains(text(),'org.openmrs.scheduler.tasks.AlertReminderTask')]")
    chosen_schedule_class.click
  end

  def enter_task_description(arg)
    task_description = get_task_description
    task_description.set arg
  end

  def enter_start_time(arg)
    start_time = get_start_time
    start_time.set arg
  end

  def enter_repeat_interval(arg)
    repeat_interval = get_repeated_interval
    repeat_interval.set arg
  end

  def press_save_button
    save_button = get_save_button
    save_button.click
  end

  def task_message_exist?(message)
    created_task_message = get_created_task_message
    created_task_message == message
  end
end

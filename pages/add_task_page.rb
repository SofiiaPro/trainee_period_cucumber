
require 'pry'

class Add_Task_Page
  attr_accessor :task_name, :schedule_class, :task_description,
                :start_time, :repeat_interval, :save_button, :created_task_message

  def initialize(browser)
    @browser = browser
    @task_name = @browser.text_field(xpath: "//input[@ng-model = 'taskName']")
    @schedule_class = @browser.select(xpath: "//select[@ng-model='schedulableClass']")
    @task_description = @browser.textarea(xpath: "//textarea[@ng-model = 'description']")
    @start_time = @browser.text_field(xpath: "//input[@ng-model = 'startTimeVal']")
    @repeat_interval = @browser.text_field(xpath: "//input[@ng-model = 'repeatInterval']")
    @save_button = @browser.button(class: "btn btn-secondary ng-binding")
    @created_task_message = @browser.element(text: "Task definition saved successfully.").text
  end

  def enter_task_name(task_name)
    @task_name.set task_name
  end

  def choose_schedule_class(schedule_class)
    @schedule_class.click
    chosen_schedule_class = @browser.option(xpath: "//option[contains(text(),'org.openmrs.scheduler.tasks.AlertReminderTask')]")
    chosen_schedule_class.click
  end

  def enter_task_description(task_description)
    @task_description.set task_description
  end

  def enter_start_time(start_time)
    @start_time.set start_time
  end

  def enter_repeat_interval(repeat_interval)
    @repeat_interval.set repeat_interval
  end

  def press_save_button
    @save_button.click
  end

  def task_message_exist?(message)
    # true if @created_task_message == message
     puts @created_task_message
  end
end

class Add_Task_Page
  attr_accessor :task_name, :shedulable_class, :task_description,
                :start_time, :repeat_interval, :save_button, :created_task_message

  def initialize(browser)
    @browser = browser
    @task_name = @browser.text_field(xpath: "//input[@ng-model = 'taskName']")
    @shedulable_class = @browser.select(xpath: "//body/div[@id='body-wrapper']/div[1]/div[3]/div[2]/div[2]/select[1]")
    @task_description = @browser.textarea(xpath: "//textarea[@ng-model = 'description']")
    @start_time = @browser.text_field(xpath: "//input[@ng-model = 'startTimeVal']")
    @repeat_interval = @browser.text_field(xpath: "//input[@ng-model = 'repeatInterval']")
    @save_button = @browser.button(class: "btn btn-secondary ng-binding")
    @created_task_message = @browser.element(class: "alert alert-success alert-dismissable ng-scope'")
  end

  def enter_task_name(task_name)
    @task_name.set (task_name)
  end

  def choose_shedulable_class(shedulable_class)
    @shedulable_class.click
    chosen_shedulable_class = @browser.option(text: shedulable_class)
    chosen_shedulable_class.click
  end

  def enter_task_description(task_description)
    @task_description.set (task_description)
  end

  def enter_start_time(start_time)
    @start_time.set(start_time)
  end

  def enter_repeat_interval(repeat_interval)
    @repeat_interval.set (repeat_interval)
  end

  def press_save_button
    @save_button.click
  end

  def check_condition(message)
    true if @created_task_message == message
  end
end

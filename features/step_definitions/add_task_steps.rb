require_relative '../../pages/home_page'
require_relative '../../pages/system_administration_page'
require_relative '../../pages/manage_sheduler_page'
require_relative '../../pages/add_task_page'

Given(/^a user on the home page and wants to add task$/) do
  @home_page = HomePage.new(@browser)
end

And(/^a user navigates to the System Administration page$/) do
  @home_page.navigate_to_system_administration_page
  @system_administration = SystemAdministrationPage.new(@browser)
end

And(/^a user chooses the Manage Scheduler option$/) do
  @system_administration.navigate_to_manage_scheduler_page
end

And(/^a user presses Add Tasks button$/) do
  @manage_schedule = ManageSchedulePage.new(@browser)
  @manage_schedule.press_add_tasks_button
end

And(/^a user fills task configuration with (.*) (.*)$/) do |task_name, schedule_class|
  @add_task = AddTaskPage.new(@browser)
  @add_task.enter_task_name(task_name.to_s)
  @add_task.choose_schedule_class(schedule_class.to_s)
end

And(/^a user fills (.*) (.*) (.*)$/) do |description, start_time, repeat_interval|
  @add_task.enter_task_description(description.to_s)
  @add_task.enter_start_time(start_time.to_s)
  @add_task.enter_repeat_interval(repeat_interval.to_s)
end


When(/^a user presses Save button$/) do
  @add_task.press_save_button
end

Then(/^a user should see (.*) on the page$/) do |message|
  expect(@add_task.task_message_exist?(message)).to be true
end


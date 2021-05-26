require_relative '../../pages/home_page'
require_relative '../../pages/system_administration_page'
require_relative '../../pages/manage_sheduler_page'
require_relative '../../pages/add_task_page'

Given (/^user on the home page$/) do
  @Home_page = Home_Page.new(@browser)
end

And(/^A user navigate to System Administration page$/) do
  @Home_page.navigate_to_system_administration_page
  @System_Administration = System_Administration_Page.new(@browser)
end

And(/^A user choose Manage Scheduler$/) do
  @System_Administration.navigate_to_manage_scheduler_page
end

And(/^A user press Add Tasks button$/) do
  @Manage_Schedule = Manage_Schedule_Page.new(@browser)
  @Manage_Schedule.press_add_tasks_button
end

And(/^A user fill in Name with "([^"]*)"$/) do |arg|
  @Add_task = Add_Task_Page.new(@browser)
  @Add_task.enter_task_name(arg.to_s)
end

And(/A user choose schedulable class "([^"]*)"$/) do |arg|
  @Add_task.choose_shedulable_class(arg.to_s)
end

And(/^A user fill in Description with "([^"]*)"$/) do |arg|
  @Add_task.enter_task_description(arg.to_s)
end

And(/^A user fill in Start time with "([^"]*)"$/) do |arg|
  @Add_task.enter_start_time(arg.to_s)
end

And(/^A user fill in Repeat interval with "([^"]*)"$/) do |arg|
  @Add_task.enter_repeat_interval(arg.to_s)
end

When(/^A user press Save button$/) do
  @Add_task.press_save_button
end
Then(/^A user should see message "([^"]*)"$/) do |arg|
  @Add_task.check_condition(arg.to_s)
  expect(@condition).should be
end

Feature: Login in Clinic functionality
  
  Background:
    Given A user is on the login page
    And A user fills in Username with "admin"
    And A user fills in Password with "Admin123"
    And A user chooses Outpatient Clinic location for the session
    When A user presses Login in button
    Then A user should be on the users home page and see "Logged in"
    
  Scenario: Find Patient
    Given a user on the home page and want to find patient
    And a user navigate to Find Patient Record
    And a user fill Search Field with "John Smith"
    And a user verify that table contains required columns "Identifier", "Name", "Gender", "Age" "Birthdate"
    When a user verify that columns are not empty
    Then a user should see patient "John Smith" in patient record
    
  Scenario Outline: Register a new patient
    Given a user on the home page and wants to register a new patient
    And a user navigate to Register a Patient page
    And a user determines Patient Demographics  with <name> <surname> <years>
    And a user determines Patient Contact info with <address> <city> <state> <country> <postal_code>
    And a user determines Patient Phone Number with <phone_number>
    And a user determines Patient Relatives with <relationship_type> <relative_person_name>
    When a user confirms shipment by pressing Confirm button
    Then a user should see patient name <name> and surname <surname> in register
    
    Examples:
      | name | surname | years | address         | city     | state    | country | postal_code | phone_number | relationship_type | relative_person_name |
      | John | Smith   | 35    | 17 State Street | New York | New York | US      | 10004       | 458000487    | Child             | Kate Smith           |

  
  Scenario Outline: Add task in System Administration Manage Schedule
    Given a user on the home page and wants to add task
    And a user navigates to the System Administration page
    And a user chooses the Manage Scheduler option
    And a user presses Add Tasks button
    And a user fills task configuration with <task_name> <schedule_class>
    And a user fill <description> <start_time> <repeat_interval>
    When a user press Save button
    Then a user should see message <message>
    
    Examples:
    | task_name | schedule_class                                  | description  | start_time               | repeat_interval     | message                             |
    | task1     | org.openmrs.scheduler.tasks.AutoCloseVisitsTask | description1 | 2021-03-20 12:12:00.000  | 1                   | Task definition saved successfully. |
    
    
    Scenario Outline: Merge records for two patients
     Given a user on the home page and wants to merge patient's record
     And a user navigates to the Data Management page
     And a user navigates to the Merge Patient Electronic Records
     And a user enters persons' ids <first_person_id> <second_person_id>
     And a user presses Continue button
     And a user selects the preferred record by click on the second patient data
     When a user presses continue button
     Then a user should see two patients id: <first_person_id> and <second_person_id> at the page
     Examples:
      | first_person_id | second_person_id |
      | 100HM1          | 100HNY           |
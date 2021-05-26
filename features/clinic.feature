Feature: Login in Clinic functionality

  Background:
    Given A user on the login page
    And A user fill in Username with "admin"
    And A user fill in Password with "Admin123"
    And A user choose Outpatient Clinic location for the session
    When A user press Login in button
    Then A user should be on the users home page and see "Logged in"
  
  Scenario: Find Patient
    Given A user on the home page and want to find patient
    And A user navigate to Find Patient Record
    And A user fill Search Field with "John Smith"
    And A user verify that table contains required columns "Identifier", "Name", "Gender", "Age" "Birthdate"
    When A user verify that columns are not empty
    Then A user should see patient "John Smith" in patient record
  
  Scenario: Register a new patient
    Given A user on the home page and want to register a new patient
    And A user navigate to Register a Patient page
    And A user determine Demography by filling Name Field with "Mark"
    And A user fill Surname Field with "Smith" and press Enter
    And A user choose gender of patient, click on male and press Enter
    And A user fill Estimated years Field with "35" and press Enter
    And A user fill Address Field with "17 State Street"
    And A user fill City or Village Field with "New York"
    And A user fill State Field with "New York"
    And A user fill Country Field with "US"
    And A user fill Postal Code Field with "10004"
    And A user fill Patient Phone Number Field with "458000487" and press Enter
    And A user choose Patient Relationship with "Sibling"
    And A user fill Name of Individual Field with "Kate Smith" and press Enter
    When A user confirm shipment by pressing "Confirm button"
    Then A user should see patient name "Mark" and surname "Smith" in register
    
  Scenario: Add task in System Administration Manage Schedule
    Given A user on the home page and want to add task
    And A user navigate to System Administration page
    And A user choose Manage Scheduler
    And A user press Add Tasks button
    And A user fill in Name with "task1"
    And A user choose schedulable class "org.openmrs.scheduler.tasks.ProcessHL7InQueueTask"
    And A user fill in Description with "description1"
    And A user fill in Start time with "2021-03-20 12:12:00.000"
    And A user fill in Repeat interval with "1"
    When A user press Save button
    Then A user should see message "Task definition saved successfully."
      
    Scenario: Merge records for two patients
     Given A user on the home page and want to merge patient's record
     And A user navigate to Data Management page
     And A user navigate to Merge Patient Electronic Records
     And A user fill in first person id field with "100HM1"
     And A user fill in second person id field with "100HNY"
     And A user press Continue button
     And A user select the preferred record by click on the second patient data
     When A user press continue button
     Then A user should see two patients id: "100HM1" and "100HNY" at the page
     
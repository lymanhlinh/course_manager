Feature: Student Account
  In order to use CourseManager
  As a student
  I want to register and login

  @javascript
  Scenario: Visit home page
    When I visit the home page
    And I should see Sign in link
    Then I should see Sign up link

  Scenario: Student register account
    When I visit the home page
    And I click on Sign up link
    Then I should be on the student sign up page
    When I fill on register form with my information
    And I click on Sign up button
    Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    And I should be on the home page
    When I active my student account
    Then I should see "Your email address has been successfully confirmed."
    When I login by my new account
    Then I should see "Signed in successfully"
    When I click on Sign out link
    Then I should see "Signed out successfully"
    Then I should see Sign in link

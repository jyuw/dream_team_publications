Feature: User login
  As a user
  In order to access my account
  I want to be able to login

  Background:
    Given following user exist
    | email            | password    |
    | lara@email.com   | password123 |

  Scenario: User successfully logs in
    Given I am on the "Index" page
    When I click on "Login"
    And I fill in "Email" with "lara@email.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see "Signed in successfully"

  Scenario: User inserts wrong email address
    Given I am on the "Index" page
    When I click on "Login"
    And I fill in "Email" with "laraemail.com"
    And I fill in "Password" with "password123"
    And I click on "Log in"
    Then I should see "Invalid Email or password."

  Scenario: User inserts wrong password
    Given I am on the "Index" page
    When I click on "Login"
    And I fill in "Email" with "lara@email.com"
    And I fill in "Password" with "123"
    And I click on "Log in"
    Then I should see "Invalid Email or password."

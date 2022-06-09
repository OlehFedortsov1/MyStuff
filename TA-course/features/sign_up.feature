Feature: Register feature

  Scenario: User can register
    Given Gitlab sign in page is opened
    When The user clicks on 'Register now' button
    And The user fills in First name
    And The user fills in Last name
    And The user fills in username
    And The username is saved
    And The user fills in Email
    And The user fills in Password
    And The password is saved
    And The user clicks Register button
    Then The user sees that (s)he is registered





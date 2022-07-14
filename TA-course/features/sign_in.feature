Feature: SignIn feature for user

  Scenario: Registered and set user can login using modules
    Given Gitlab sing up page is opened
    When I sign in as a preregistered user
    Then I see that new user is logged in

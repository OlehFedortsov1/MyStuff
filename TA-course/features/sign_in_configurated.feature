Feature: SignIn feature for configurated user

  Scenario: Registered and set user can login using modules
    Given Gitlab user is signed in and set up
    Then I see that configurated user is logged in

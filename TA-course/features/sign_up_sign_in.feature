Feature: iSign up and then sign in

  Scenario: iUser can register

    Given Sign in page is opened
    When I register user via UI
    Then And I see that user is registered

    Scenario: Register user can sign up

      Given Gitlab sing up page is opened
      When I sign in as a preregistered user
      Then I see that new user is logged in

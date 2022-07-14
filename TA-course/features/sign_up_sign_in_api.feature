Feature: Sign up and then sign in

  Scenario: User can sign up via API
    When I register user via "API"
    Then And I see that user is registered via API

  Scenario: Register user can sign up

    Given Gitlab sing up page is opened
    When I sign in as a preregistered user
    Then I see that new user is logged in via page
    And I can delete user via API
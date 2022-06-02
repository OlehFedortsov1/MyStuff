Feature: Sign in feature

    Scenario: User can log in
      Given Gitlab page is opened
      When The user fill in username
      And The user fill in password
      And The user click sign in button
      Then The user sees that (s)he is logged in

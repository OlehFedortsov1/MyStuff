Feature: Sign up and then sign in

Scenario: User can register

    Given Sign in page is opened
      When I click on 'Register now' button
      And I fill in First name
      And I fill in Last name
      And I fill in username
      And Username is saved
      And I fill in Email
      And I fill in Password
      And Password is saved
      And I click Register button
      And I sees that user is registered
      And I open sign in page
      And I sign in as a newly created user
      Then I see user logged in

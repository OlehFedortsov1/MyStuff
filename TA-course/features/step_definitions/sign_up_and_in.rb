unique_username = SecureRandom.hex(6)

Given(/^Sign in page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^I click on 'Register now' button$/) do
  @sign_in_page.register_btn.click
end

And(/^I fill in First name$/) do
  @sign_up_page = SignUpPage.new
  @sign_up_page.first_name_field.set 'John' + unique_username
end

And(/^I fill in Last name$/) do
  @sign_up_page.last_name_field.set 'Travolta'
end

And(/^I fill in username$/) do
  @sign_up_page.username_field.set unique_username + 'John'
end

And(/^Username is saved$/) do
  new_user_credentials = File.new("new_user_creds.txt", 'w')
  new_user_credentials.write( unique_username + "John")
  new_user_credentials.close
end

And(/^I fill in Email$/) do
  @sign_up_page.email_field.set unique_username + '@gmail.com'
end

And(/^I fill in Password$/) do
  @sign_up_page.password_field.set 'Oleh123+' + unique_username
end

And(/^Password is saved$/) do
  new_user_credentials = File.open("new_user_creds.txt", 'a+')
  new_user_credentials.write("\nOleh123+" + unique_username)
  new_user_credentials.close
end

And(/^I click Register button$/) do
  @sign_up_page.register_btn.click
end

And(/^I sees that user is registered$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_text.text).to eql "Welcome to GitLab,\nJohn#{unique_username}!"
  reset_session!
end

And(/^I open sign in page$/) do
  visit 'https://gitlab.testautomate.me/users/sign_in'
end

And(/^I sign in as a newly created user$/) do
  user_creds = File.read("new_user_creds.txt").split("\n")
  sign_in_user user_creds[0], user_creds[1]
end

Then(/^I see user logged in$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_text.text).to eql "Welcome to GitLab,\nJohn#{unique_username}!"
end


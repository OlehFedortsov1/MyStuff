unique_username = SecureRandom.hex(6) #first googled solution for random username generator. Here is a link https://stackoverflow.com/questions/63892602/ruby-unique-username-generator

Given(/^Gitlab sign in page is opened$/)do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^The user clicks on 'Register now' button$/) do
  @sign_in_page.register_btn.click
end

And(/^The user fills in First name$/) do
  @sign_up_page = SignUpPage.new
  @sign_up_page.first_name_field.set 'John' + unique_username
end

And(/^The user fills in Last name$/) do
  @sign_up_page.last_name_field.set 'Travolta'
end

And(/^The user fills in username$/) do
  @sign_up_page.username_field.set 'John' + unique_username
end

And(/^The username is saved$/) do
  new_user_credentials = File.new("new_user_creds.txt", 'w')
  new_user_credentials.write("John" + unique_username)
  new_user_credentials.close
end

And(/^The user fills in Email$/) do
  @sign_up_page.email_field.set unique_username + '@gmail.com'
end

And(/^The user fills in Password$/) do
  @sign_up_page.password_field.set 'Oleh123+' + unique_username
end

And(/^The password is saved$/) do
  new_user_credentials = File.open("new_user_creds.txt", 'a+')
  new_user_credentials.write("\nOleh123+" + unique_username)
  new_user_credentials.close
end

And(/^The user clicks Register button$/) do
  @sign_up_page.register_btn.click
end

Then(/^The user sees that \(s\)he is registered$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_text.text).to eql "Welcome to GitLab,\nJohn#{unique_username}!"
end

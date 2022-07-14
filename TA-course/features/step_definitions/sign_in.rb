Given(/^Gitlab sing up page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^I sign in as a preregistered user$/) do
  user_credentials = JSON.parse(File.read('user.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
end

Then(/^I see that new user is logged in$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_msg.text).to include 'Welcome to GitLab'
end

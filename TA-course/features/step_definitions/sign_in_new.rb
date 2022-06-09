Given(/^Gitlab user is signed in$/) do
  user_creds = File.read("new_user_creds.txt").split("\n")
  sign_in_user user_creds[0], user_creds[1]
end

Then(/^I see that user is logged in$/) do
  user_creds = File.read("new_user_creds.txt").split("\n")
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_text.text).to eql "Welcome to GitLab,\n#{user_creds[0]}!"
end


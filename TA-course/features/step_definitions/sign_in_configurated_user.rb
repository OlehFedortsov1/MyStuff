Given(/^Gitlab user is signed in and set up$/) do
  sign_in_user 'uitestuser','testpassword123'
end

Then(/^I see that configurated user is logged in$/) do
  @home_page = HomePage.new
  expect(@home_page.welcome_msg.text).to eql 'Welcome to GitLab'
end
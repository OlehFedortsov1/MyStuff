Given(/^Sign in page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^I register user via UI$/) do
  @user = User.new
  sign_up_user @user
  response = RestClient.get("https://gitlab.testautomate.me/api/v4/users?username=#{@user.username}", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})

  user_credentials = {username: @user.username, password: @user.password, id: JSON.parse(response.body)[0]['id']}.to_json
  File.open('user.json', 'w') { |file| file.write( user_credentials) }
end

Then(/^And I see that user is registered$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_msg.text).to eql "Welcome to GitLab,\n#{@user.firstname}!"
end
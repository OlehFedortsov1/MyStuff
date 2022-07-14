Given(/^Sign in page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

Then(/^And I see that user is registered$/) do
  @new_user_registered_page = NewUserRegisteredPage.new
  expect(@new_user_registered_page.welcome_msg.text).to eql "Welcome to GitLab,\n#{@user.firstname}!"
end

When(/^I register user via "([^"]*)"$/) do |method|
  @user = User.new
  case method
  when 'API'
    sign_up_user_api @user
    response = get_user_api @user
  when 'UI'
    sign_up_user @user
    response = get_user_api @user
  else
    raise 'User registration method is not defined'
  end
  user_credentials = {username: @user.username, password: @user.password, id: JSON.parse(response.body)[0]['id']}.to_json
  File.open('user.json', 'w') { |file| file.write( user_credentials) }
end
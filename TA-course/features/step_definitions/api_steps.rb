Then(/^And I see that user is registered via API$/) do
  response = get_user_api @user
  expect(response.code).to eql 200
  expect(JSON.parse(response.body)[0]['username']).to eql @user.username
  expect(JSON.parse(response.body)[0]['email']).to eql @user.email
  expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end

Then(/^I see that new user is logged in via page$/) do
  @home_page = HomePage.new
  expect(@home_page.welcome_msg.text).to include 'Welcome to GitLab'
end

And(/^I can delete user via API$/) do
  response = delete_user_api
  expect(response.code).to eql 204
end

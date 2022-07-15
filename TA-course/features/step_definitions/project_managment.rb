Given(/^I register 'Project Owner' user via 'API'$/) do
  @user = User.new
  sign_up_user_api @user
  response = get_user_api @user
  user_credentials = { username: @user.username, password: @user.password,
                       id: JSON.parse(response.body)[0]['id'] }.to_json
  File.open('project_owner.json', 'w') { |file| file.write(user_credentials) }
end


And(/^I see this 'Project Owner' user is registered via 'API'$/) do
  response = get_user_api @user
  expect(response.code).to eql 200
  expect(JSON.parse(response.body)[0]['username']).to eql @user.username
  expect(JSON.parse(response.body)[0]['email']).to eql @user.email
  expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end

And(/^I register 'Developer' user via 'API'$/) do
  @user = User.new
  sign_up_user_api @user
  response = get_user_api @user
  user_credentials = { username: @user.username, password: @user.password,
                       id: JSON.parse(response.body)[0]['id'] }.to_json
  File.open('developer.json', 'w') { |file| file.write(user_credentials) }
  user_credentials = JSON.parse(File.read('developer.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
  welcome_page

end

And(/^I see this 'Developer' user is registered via 'API'$/) do
  @dashboard = DashBoardPage.new
  expect(@dashboard.page_header.text).to include 'Welcome to GitLab'
  reset_session!
end

When(/^I log in to gitlab with 'Project Owner' user$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
  user_credentials = JSON.parse(File.read('project_owner.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
end

Then(/^I can see 'Create a project' button on the 'Home Page'$/) do
  expect(@dashboard.create_project.text).to include 'Create a project'
end

When(/^I create a nwe blank project$/) do
  @dashboard.create_new_project_btn.click
  @new_project = NewProjectPage.new
  @new_project.load
  @new_project.create_blank_project_btn.click
end

Then(/^I see that project was successfully created$/) do
  @blankproject = BlankProjectPage.new
  @blankproject.load
  expect(@blankproject.create_blank_project_header.text).to include 'Create blank project'
  generated_project_name = "#{SecureRandom.hex(10)}TestProject"
  project_name(generated_project_name)
  project_info = {name: generated_project_name}.to_json
  File.open('project.json', 'w') { |file| file.write(project_info) }
  @created_project = CreatedProjectPage.new
  sleep 3
  @created_project.load
  sleep 3
  # expect(@created_project.created_notif.text).to include 'Project  was successfully created'
end

# When(/^I open 'Project members' page$/) do
#   pending
# end
#
# Then(/^I can see 'Invite members' button$/) do
#   pending
# end
#
# When(/^I click 'Invite members' button$/) do
#   pending
# end
#
# And(/^I can see fill in search field with 'Developer' user name$/) do
#   pending
# end
#
# Then(/^I can see 'Developer' user is found$/) do
#   pending
# end
#
# When(/^I select Developer role$/) do
#   pending
# end
#
# And(/^I click Invite button$/) do
#   pending
# end
#
# Then(/^I can see that 'Developer' user was invited$/) do
#   pending
# end
#
# When(/^I create new issue$/) do
#   pending
# end
#
# Then(/^I can see that I can assign it to a 'Developer' user$/) do
#   pending
# end
#
# When(/^I log out$/) do
#   pending
# end
#
# And(/^I log in to gitlab with 'Developer' user$/) do
#   pending
# end
#
# Then(/^I can see that I have an issue assigned$/) do
#   pending
# end
#
# When(/^I open the issue$/) do
#   pending
# end
#
# Then(/^I can leave a text comment$/) do
#   pending
# end
#
# And(/^I can attach png file to comment$/) do
#   pending
# end
#
# And(/^I can 'Add a to do'$/) do
#   pending
# end
#
# And(/^I can 'Mark as done'$/) do
#   pending
# end
#
# And(/^I can close the issue$/) do
#   pending
# end
#
# Then(/^I can go to Project General settings$/) do
#   pending
# end
#
# When(/^I expand Advanced Settings$/) do
#   pending
# end
#
# And(/^I delete project$/) do
#   pending
# end
#
# Then(/^I see that project is deleted$/) do
#   pending
# end
#
# Then(/^I can delete 'Project Owner' user via API$/) do
#   pending
# end
#
# And(/^I can delete 'Developer' user via API$/) do
#   pending
# end
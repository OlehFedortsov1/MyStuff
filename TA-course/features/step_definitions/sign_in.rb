Given(/^Gitlab page is opened$/) do
  visit 'https://gitlab.testautomate.me/users/sign_in'
end

When(/^The user fill in username$/) do
  find('#user_login').set 'uitestuser'
end

And(/^The user fill in password$/) do
  find('#user_password').set 'testpassword123'
end

And(/^The user click sign in button$/) do
  find('#new_user > div.submit-container.move-submit-down > button').click
end

Then(/^The user sees that \(s\)he is logged in$/) do
  expect(find(:xpath, '//*[@id="content-body"]/div[2]/div[1]/h2').text).to eql 'Welcome to GitLab'
end
unique_username = SecureRandom.hex(6) #first googled solution for random username generator. Here is a link https://stackoverflow.com/questions/63892602/ruby-unique-username-generator

Given(/^Gitlab sign in page is opened$/)do
 visit 'https://gitlab.testautomate.me/users/sign_in'
 sleep 1 #sleep added for better observation of test executing.
end

When(/^The user clicks on 'Register now' button$/) do
  find('#signin-container > p > a').click
  sleep 1
end

And(/^The user fills in First name$/) do
  find('#new_user_first_name').set 'John' + unique_username
  sleep 1
end

And(/^The user fills in Last name$/) do
  find('#new_user_last_name').set 'Travolta'
  sleep 1
end

And(/^The user fills in username$/) do
  find('#new_user_username').set unique_username + 'John'
  sleep 1

end

And(/^The user fills in Email$/) do
  find('#new_user_email').set unique_username + '@gmail.com'
  sleep 1
end

And(/^The user fills in Password$/) do
  find('#new_user_password').set 'Oleh123+'
  sleep 1
end

And(/^The user clicks Register button$/) do
  find('#new_new_user > div.submit-container.gl-mt-5 > input').click
  sleep 1
end

Then(/^The user sees that \(s\)he is registered$/) do
  expect(find(:xpath, '//*[@id="content-body"]/div[2]/div/div/h2').text).to eql "Welcome to GitLab,\nJohn#{unique_username}!"
  sleep 1
end

# frozen_string_literal: true

class WelcomePage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_up/welcome'

  element :role_selector, '#user_role'
  element :developer_selector, '#user_role > option:nth-child(2)'
  element :get_started_button, :xpath, '/html/body/div[1]/div/div[2]/main/div[2]/div/div/form/div[5]/div/button'
end

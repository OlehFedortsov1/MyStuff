# frozen_string_literal: true

# This module contains repeatable actions for UI
module FeatureHelper
  def sign_in_user(username, password)
    @sign_in_page = SignInPage.new
    @sign_in_page.load
    @sign_in_page.login_field.set username
    @sign_in_page.password_field.set password
    @sign_in_page.sign_in_btn.click
  end

  def sign_up_user(user)
    @sign_up_page = SignUpPage.new
    @sign_up_page.load
    @sign_up_page.first_name_field.set user.firstname
    @sign_up_page.last_name_field.set user.lastname
    @sign_up_page.email_field.set user.email
    @sign_up_page.username_field.set user.username
    @sign_up_page.password_field.set user.password
    @sign_up_page.register_btn.click
  end

  def welcome_page
    @welcome_page = WelcomePage.new
    @welcome_page.load
    @welcome_page.developer_selector.click
    @welcome_page.get_started_button.click
  end

  def project_name(project_name)
    @blank_project_page = BlankProjectPage.new
    @blank_project_page.load
    @blank_project_page.project_name_field.set project_name
    @blank_project_page.create_project_btn.click
  end
end

# frozen_string_literal: true

class NewProjectPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/projects/new'

  element :create_blank_project_btn, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/div[1]/div[1]/a'
  end

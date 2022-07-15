# frozen_string_literal: true

class BlankProjectPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/projects/new#blank_project'

  element :create_blank_project_header, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/div[1]/h4'
  element :project_name_field, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/div[2]/div/div/form/div[1]/div[1]/input'
  element :create_project_btn, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/div[2]/div/div/form/input[2]'

end
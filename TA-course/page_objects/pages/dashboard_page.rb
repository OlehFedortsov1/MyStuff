# frozen_string_literal: true

class DashBoardPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/dashboard/projects'

  element :page_header, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[1]/h2'
  element :create_project, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/a[1]/div[2]/h3'
  element :create_new_project_btn, :xpath, '/html/body/div[3]/div/div[3]/main/div[2]/div[2]/a[1]'
end



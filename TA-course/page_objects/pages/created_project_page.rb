# frozen_string_literal: true

class CreatedProjectPage< SitePrism::Page

  username_url_param = JSON.parse(File.read('project_owner.json'))
  project_url_param = JSON.parse(File.read('project.json'))
  url = "https://gitlab.testautomate.me/#{username_url_param['username']}/#{project_url_param['name']}"

  set_url "#{url}"
  element :created_notif, :xpath, '/html/body/div[3]/div/div[3]/main/div[1]/div'
end
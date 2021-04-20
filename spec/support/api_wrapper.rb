# frozen_string_literal: true

require 'rest-client'

# This module contains api helper methods
module ApiWrapper
  def sign_up_user_api(json_user)
    response = RestClient
               .post "#{ENV['ROOT_URL']}users.json",
                     json_user,
                     api_headers

    raise 'Can`t create user via API' unless response.code == 201
  end

  def api_headers
    { content_type: :json, 'x-redmine-api-key': ENV['API_KEY'] }
  end
end

# frozen_string_literal: true

# This module contains file helper methods
module FileHelper
  def save_user_to_file_json(user_json)
    File.open(ENV['USER_PATH'], 'w') { |file| file.write user_json }
  end

  def reed_user_from_file_json
    JSON.parse(File.read(ENV['USER_PATH']))
  end

  def clean_user_json_file
    File.delete(ENV['USER_PATH'])
  end
end

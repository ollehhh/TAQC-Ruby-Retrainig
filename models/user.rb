# frozen_string_literal: true

require 'ffaker'

# This class describes User Model
class User
  attr_reader :username, :password, :firstname, :lastname, :email

  def initialize; end

  def generate_random_user
    @username = FFaker::Identification.ssn
    @password = FFaker::Internet.password
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @email = FFaker::Internet.email
  end

  def user_from_json(json_user)
    @username = json_user['login']
    @password = json_user['password']
    @firstname = json_user['firstname']
    @lastname = json_user['lastname']
    @email = json_user['mail']
  end

  def json_from_user
    { login: @username, password: @password, firstname: @firstname, lastname: @lastname, mail: @email }
  end

  def json_user_for_api
    { user: json_from_user }
  end
end

# frozen_string_literal: true

# This module contains feature helper methods
module FeatureHelper
  def sign_up_user
    @sign_up_page = SignUpPage.new
    @sign_up_page.loaded?

    @user = User.new
    @user.generate_random_user

    @sign_up_page.login_field.set @user.username
    @sign_up_page.password_field.set @user.password
    @sign_up_page.password_confirm_field.set @user.password
    @sign_up_page.firstname_field.set @user.firstname
    @sign_up_page.lastname_field.set @user.lastname
    @sign_up_page.email_field.set @user.email

    @sign_up_page.submit_btn.click

    save_user_to_file_json(@user.json_from_user.to_json)
    @user
  end

  def sign_in_user
    @sign_in_page = SignInPage.new
    @sign_in_page.loaded?

    @user = User.new
    @user.user_from_json(reed_user_from_file_json)

    @sign_in_page.login_field.set @user.username
    @sign_in_page.password_field.set @user.password
    @sign_in_page.submit_btn.click
    @user
  end
end

class SignUpPage < SitePrism::Page

  section :menu, MenuSection,'#top-menu'

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :password_confirm_field, '#user_password_confirmation'
  element :firstname_field, '#user_firstname'
  element :lastname_field, '#user_lastname'
  element :email_field, '#user_mail'
  element :submit_btn, '#new_user > input[type=submit]:nth-child(4)'

end

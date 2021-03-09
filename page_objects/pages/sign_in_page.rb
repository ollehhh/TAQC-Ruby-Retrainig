class SignInPage < SitePrism::Page

  section :menu, MenuSection,'#top-menu'

  element :login_field, '#username'
  element :password_field, '#password'
  element :submit_btn, '#login-submit'

end

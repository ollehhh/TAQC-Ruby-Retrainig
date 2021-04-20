# frozen_string_literal: true

feature 'Authentication tests' do
  after :all do
    clean_user_json_file
  end

  before :each do
    @home_page = HomePage.new
    @home_page.load
  end

  scenario 'Can create new user' do
    @home_page.menu.sign_up_link.click
    @user = sign_up_user
    expect(@home_page.menu.logged_as.text).to have_content "Logged in as #{@user.username}"
  end

  scenario 'User can sign in' do
    @home_page.menu.sign_in_link.click
    sign_in_user
    expect(@home_page.menu.logged_as.text).to have_content "Logged in as #{@user.username}"
  end

  scenario 'Can create new user via API' do
    @home_page.menu.sign_in_link.click
    @user = User.new
    @user.generate_random_user
    sign_up_user_api(@user.json_user_for_api.to_json)
    save_user_to_file_json(@user.json_from_user.to_json)
    sign_in_user
    expect(@home_page.menu.logged_as.text).to have_content "Logged in as #{@user.username}"
  end
end

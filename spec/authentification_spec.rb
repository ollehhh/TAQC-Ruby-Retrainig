feature 'Authentication tests' do
  before :all do
    random = Time.now.to_i.to_s
    username = 'test_' + random
    password = 'test1234'
    firstname = 'test_'+ random
    lastname = random + '_test'
    email = "test#{random}@test.org"
    hash = {username: username, password: password, firstname: firstname, lastname: lastname, email: email}
    File.open("test_data/user.json","w") {|f| f.write hash.to_json}
  end

  after :all do
    File.delete("test_data/user.json")
  end

  before :each do
    @home_page = HomePage.new
    @home_page.load
  end

  scenario 'Can create new user' do
    file = File.read("test_data/user.json")
    file_data = JSON.parse(file)

    @home_page.menu.sign_up_link.click

    @sign_up_page = SignUpPage.new

    @sign_up_page.login_field.set file_data['username']
    @sign_up_page.password_field.set file_data['password']
    @sign_up_page.password_confirm_field.set file_data['password']
    @sign_up_page.firstname_field.set file_data['firstname']
    @sign_up_page.lastname_field.set file_data['lastname']
    @sign_up_page.email_field.set file_data['email']

    @sign_up_page.submit_btn.click

    expect(@home_page.menu.logged_as.text).to have_content 'Logged in as test'
  end

  scenario 'User can sign in' do
    file = File.read("test_data/user.json")
    file_data = JSON.parse(file)

    @home_page.menu.sign_in_link.click

    @sign_in_page = SignInPage.new

    @sign_in_page.login_field.set file_data['username']
    @sign_in_page.password_field.set file_data['password']
    @sign_in_page.submit_btn.click

    expect(@home_page.menu.logged_as.text).to have_content 'Logged in as test'
  end
end

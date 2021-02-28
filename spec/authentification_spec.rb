feature 'Authentication tests' do
  scenario 'Create user config' do
    random = Time.now.to_i.to_s
    username = 'test_' + random
    password = 'test1234'
    firstname = 'test_'+ random
    lastname = random + '_test'
    email = "test#{random}@test.org"
    hash = {"username" => username, "password" => password, "firstname" => firstname, "lastname" => lastname, "email" => email}
    File.open("user.json","w"){|f| f.write hash.to_json}
  end

  scenario 'Can create new user' do
    file = File.read("user.json")
    file_date = JSON.parse(file)

    visit('http://testautomate.me/redmine')

    find('.register').click

    find('#user_login').set file_date['username']
    find('#user_password').set file_date['password']
    find('#user_password_confirmation').set file_date['password']
    find('#user_firstname').set file_date['firstname']
    find('#user_lastname').set file_date['lastname']
    find('#user_mail').set file_date['email']

    find('#new_user > input[type=submit]:nth-child(4)').click

    expect(page).to have_content 'Logged in as test'
  end

  scenario 'User can log in' do
    file = File.read("user.json")
    file_date = JSON.parse(file)

    visit('http://testautomate.me/redmine')

    find('.login').click

    find('#username').set file_date['username']
    find('#password').set file_date['password']
    find('#login-submit').click

    expect(page).to have_content 'Logged in as test'
  end

  scenario 'Delete user config' do
    File.delete("user.json")
  end
end

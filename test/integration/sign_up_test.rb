require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  test "invalid data" do
    get signup_path
    assert_template "users/new"
    assert_no_difference "User.count" do
      post users_path, params: {user: {
        name: "Name",
        email: "valid@email.com",
        password: "",
        password_confirmation: ""
      }}
    end
    assert_template "users/new"
  end

  test "valid data" do
    get signup_path
    avatar = fixture_file_upload("test/fixtures/files/logo.png")
    assert_difference "User.count", 1 do
      post users_path, params: {user: {
        name: "Name",
        email: "valid@email.com",
        password: "foobar",
        password_confirmation: "foobar",
        avatar: avatar
      }}
    end
    assert flash.any?
    assert_redirected_to root_url
    assert_not logged_in?
    assert User.find_by(name: "Name").avatar?
  end
end

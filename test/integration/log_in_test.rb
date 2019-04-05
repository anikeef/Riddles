require 'test_helper'

class LogInTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "layout before login" do
    get login_path
    assert_template "sessions/new"
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path, false
    assert_select "a[href=?]", new_riddle_path, false
  end

  test "invalid data" do
    post login_path, params: {session: {
      email: "ivalid@email.com",
      password: "foobar"
    }}
    assert_template "sessions/new"
    assert_select "div.alert-errors"
  end

  test "non-matching password" do
    post login_path, params: {session: {
      email: @user.email,
      password: "invalid"
    }}
    assert_template "sessions/new"
    assert_select "div.alert-errors"
  end

  test "valid data and right layout after login and logout" do
    post login_path, params: {session: {
      email: @user.email,
      password: "password"
    }}
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", new_riddle_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", signup_path, false
    assert_select "a[href=?]", login_path, false
    #Log out
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", new_riddle_path, false
    assert_select "a[href=?]", logout_path, false
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
  end

end

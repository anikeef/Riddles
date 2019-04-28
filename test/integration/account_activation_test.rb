require 'test_helper'

class AccountActivationTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: {user: {
      name: "User",
      email: "user@user.com",
      password: "password",
      password_confirmation: "password"
    }}
    @user = assigns(:user)#User.find_by(email: "user@user.com")
  end

  test "try to log in before activation" do
    assert_not logged_in?
    log_in_as @user
    assert_redirected_to root_url
    assert_not logged_in?
    assert flash.any?
  end

  test "invalid activation token" do
    get edit_account_activation_path(User.new_token, email: @user.email)
    assert_redirected_to root_url
    assert_not flash[:errors].blank?
    assert_not logged_in?
    assert_not @user.reload.activated?
  end

  test "valid activation token" do
    get edit_account_activation_path(@user.activation_token, email: @user.email)
    assert_redirected_to root_url
    assert_not flash[:success].blank?
    assert logged_in?
    assert @user.reload.activated?
  end
end

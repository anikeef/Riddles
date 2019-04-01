require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "email@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "name presence" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name length" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end

  test "password presence" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password length" do
    @user.password = @user.password_confirmation = "foo"
    assert_not @user.valid?
  end

  test "password confirmation" do
    @user.password_confirmation = "barbaz"
    assert_not @user.valid?
  end

  test "email presence" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email format" do
    @user.email = "ivalid@email"
    assert_not @user.valid?
    @user.email = "@invalid.com"
    assert_not @user.valid?
  end
end

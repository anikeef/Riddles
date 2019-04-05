require 'test_helper'

class NewRiddleTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    log_in_as @user
  end

  test "invalid riddle" do
    get new_riddle_path
    assert_template "riddles/new"
    assert_no_difference "Riddle.count" do
      post riddles_path, params: {riddle: {
        body: "foobar",
        answer: ""
      }}
    end
    assert_template "riddles/new"
    assert_select "div.alert-errors"
  end

  test "valid riddle" do
    assert_difference "@user.riddles.count", 1 do
      post riddles_path, params: {riddle: {
        body: "foobar",
        answer: "foobar"
      }}
    end

  end
end

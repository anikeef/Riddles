require 'test_helper'

class NewProblemTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    log_in_as @user
  end

  test "invalid problem" do
    get new_problem_path
    assert_template "problems/new"
    assert_no_difference "Problem.count" do
      post problems_path, params: {problem: {
        body: "foobar",
        answer: ""
      }}
    end
    assert_template "problems/new"
    assert_select "div.alert-errors"
  end

  test "valid problem" do
    picture = fixture_file_upload("test/fixtures/files/avatar.jpg")
    assert_difference "@user.problems.count", 1 do
      post problems_path, params: {problem: {
        body: "foobar",
        answer: "foobar",
        picture: picture
      }}
    end
    assert @user.problems.last.picture?
  end
end

require 'test_helper'

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @problem = @user.problems.create!(body: "abc", answer: "def")
  end

  test "should get index" do
    get problems_url
    assert_response :success
  end

  test "should not allow unauthenticated users to create problems" do
    get new_problem_path
    assert_redirected_to root_url
    post problems_path
    assert_redirected_to root_url
  end

  test "should not allow user to destroy another's problem" do
    log_in_as @other_user
    assert_no_difference "Problem.count" do
      delete problem_path(@problem)
    end
    assert_redirected_to root_url
  end

  test "should delete posts" do
    log_in_as @user
    assert_difference "Problem.count", -1 do
      delete problem_path(@problem)
    end
    assert flash.any?
    assert_redirected_to root_url
  end
end

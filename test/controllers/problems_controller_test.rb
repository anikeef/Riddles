require 'test_helper'

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
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
end

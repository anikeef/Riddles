require 'test_helper'

class RiddlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get index" do
    get riddles_url
    assert_response :success
  end

  test "should not allow unauthenticated users to create riddles" do
    get new_riddle_path
    assert_redirected_to root_url
    post riddles_path
    assert_redirected_to root_url
  end
end

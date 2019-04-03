require 'test_helper'

class RiddlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get riddles_url
    assert_response :success
  end

end

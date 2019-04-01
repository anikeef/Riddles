require 'test_helper'

class RiddleTest < ActiveSupport::TestCase
  def setup
    @riddle = Riddle.new(body: "How much is 2 + 2", answer: "Not so much", user: User.new)
  end

  test "valid riddle" do
    assert @riddle.valid?
  end

  test "body presence" do
    @riddle.body = " " * 10
    assert_not @riddle.valid?
  end

  test "answer presence" do
    @riddle.body = " " * 10
    assert_not @riddle.valid?
  end

  test "user presence" do
    @riddle.user = nil
    assert_not @riddle.valid?
  end
end

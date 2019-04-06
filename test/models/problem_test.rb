require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  def setup
    @problem = Problem.new(body: "How much is 2 + 2", answer: "Not so much", user: User.new)
  end

  test "valid problem" do
    assert @problem.valid?
  end

  test "body presence" do
    @problem.body = " " * 10
    assert_not @problem.valid?
  end

  test "answer presence" do
    @problem.body = " " * 10
    assert_not @problem.valid?
  end

  test "user presence" do
    @problem.user = nil
    assert_not @problem.valid?
  end
end

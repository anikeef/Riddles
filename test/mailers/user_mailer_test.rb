require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account activation" do
    user = users(:one)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal [user.email], mail.to
    assert_equal "Problems account activation", mail.subject
    assert_match user.activation_token, mail.body.to_s
    assert_match user.name, mail.body.to_s
  end
end

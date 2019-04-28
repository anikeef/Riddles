class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: @user.email, subject: "Problems account activation"
  end
end

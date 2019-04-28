class SessionsController < ApplicationController
  before_action :logged_out, except: :destroy

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        redirect_to root_url
      else
        flash[:info] = "Account not activated. Please check your email for activation link"
        redirect_to root_url
      end
    else
      flash.now[:errors] = "Please enter valid email and password"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def logged_out
    redirect_to root_url if logged_in?
  end
end

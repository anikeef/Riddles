class UsersController < ApplicationController
  before_action :logged_in, only: :index

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Problems!"
      log_in @user
      redirect_to root_url
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in
    redirect_to root_url unless logged_in?
  end
end

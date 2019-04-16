class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    redirect_to root_url unless logged_in?
  end

  def logged_out_user
    redirect_to root_url if logged_in?
  end
end

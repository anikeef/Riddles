ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  fixtures :all
  include SessionsHelper

  def log_in_as user
    post login_path, params: {session: {
      email: user.email,
      password: "password"
    }}
  end

  def is_logged_in?
    !!session[:user_id]
  end
end

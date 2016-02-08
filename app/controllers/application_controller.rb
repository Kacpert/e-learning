class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # # Prevent CSRF attacks by raising an exception.
  # # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def home
  end

  include Authenticable

end

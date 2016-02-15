class ApplicationController < ActionController::Base

  def home
  end

  include Authenticable
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
end

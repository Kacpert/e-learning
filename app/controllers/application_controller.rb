class ApplicationController < ActionController::Base
  include Authenticable
  include CanCan::ControllerAdditions

  def home
  end

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: 'You are not authorized to access this page' }, status: :unauthorized
  end
end

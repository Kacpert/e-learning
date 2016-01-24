module Authenticable
  extend ActiveSupport::Concern

  included do
    helper_method :devise_current_user
  end
  # Devise methods overwrites
  def current_user
    if request.headers['Authorization'].blank?
      devise_current_user
    else
      @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    end
  end

  def devise_current_user
    @devise_current_user ||= warden.authenticate(:scope => :user)
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end
end
class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_with_token!, only: [:destroy]
  def create
    user_password = params[:password]
    user_email = params[:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.present? and user.valid_password? user_password
      sign_in user, store: false
      render json: user, status: 200, location: api_v1_users_url(user)
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end


  def destroy
    user = current_user
    user.generate_authentication_token!
    user.save
    render json: {success: 'successfully logged out'}, status: 200
  end
end


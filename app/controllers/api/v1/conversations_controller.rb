class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_with_token!
  def create
    params[:user_ids] += [ current_user.id ]
    conversation = Conversation.new(conversation_params)
    if conversation.save

      render json: {id: conversation.id ,user_ids: conversation.users.ids}, status: 201, location: api_v1_conversations_url(conversation)
    else
      render json: { errors: conversation.errors }, status: 422
    end
  end

  private

  def conversation_params
    params.permit(:user_ids => [])
  end
end

class Api::V1::ConversationsController < ApplicationController
  before_action :authenticate_with_token!

  def index
    @user = current_user
    @conversations = @user.conversations
  end

  def create
    params[:user_ids] += [ current_user.id ]
    conversation = Conversation.new(conversation_params)
    if conversation.save

      render json: {id: conversation.id ,user_ids: conversation.users.ids}, status: 201, location: api_v1_conversations_url(conversation)
    else
      render json: { errors: conversation.errors }, status: 422
    end
  end

  def update
    if params.has_key?(:checked)
      current_user.messages_users.where(displayed: false, conversation_id: params[:id]).update_all(displayed: true)
    end
  end

  private

  def conversation_params
    params.permit(:user_ids => [])
  end
end

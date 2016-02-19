class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_with_token!
  before_action :find_message, only: [:show, :update, :destroy]
  def show
  end

  def index
    @messages = current_user.messages_users.where(displayed: false).map(&:message)
  end

  def create
    if (params.has_key?(:user_logins) and params[:user_logins].present?) and params[:user_logins].any?
      params[:user_ids] = User.where(login: params[:user_logins]).map(&:id)
    end
    params[:user_id] = current_user.id
    unless params.has_key?(:conversation_id) and params[:conversation_id].to_i.present?
      user_ids =  params[:user_ids]
      user_ids.to_a
      user_ids << current_user.id
      conversation = Conversation.create(title: params[:title])
      conversation.users << User.find(params[:user_ids])
      params[:conversation_id] = conversation.id
    end
    params[:user_ids] = Conversation.find(params[:conversation_id]).users.ids unless params.has_key?(:user_ids)
      @message = Message.new(message_params)
    if @message.save
      #update updated_at in conversation
      conversation = @message.conversation
      if @message.title.present?
        conversation.update(title: @message.title) 
      else
        conversation.update(updated_at: @message.created_at) 
      end
      @message.messages_users.where(user_id: current_user.id).first.update(displayed: true)
      render :create, status: 201, location: api_v1_message_url(@message)
    else
    render json: { errors: @message.errors }, status: 422
    end
  end

  def update
    if params.has_key?(:displayed)
      m = @message.messages_users.where(user_id: current_user.id).first
      m.displayed = true
      m.save
    end

    if @message.update(message_params)
      render json: @message, status: 200, location: api_v1_message_url(@message)
    else
      render json: { errors: @message.errors }, status: 422
    end
  end

  def destroy
    @message.destroy
    render nothing: true, status: 204
  end

  private

  def find_message
    begin
      @message = Message.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find message with id: #{params[:id]}" }, status: 412
    end
  end

  def message_params
    params.permit(:text, :user_id, :conversation_id, :title, :replay_id, :user_ids => [], :user_logins => [])
  end
end
class Api::V1::MessagesController < ActionController::Base
  before_action :find_message, only: [:show, :update, :destroy]
  def show
  end

  def index
    @messages = current_user.messages_users.where(displayed: false).map(&:message)
  end

  def create
    message = Message.new(message_params)
    if message.save
      render json: message, status: 201, location: api_v1_message_url(message)
    else
    render json: { errors: message.errors }, status: 422
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
    params.permit(:text, :user_ids => [])
  end
end
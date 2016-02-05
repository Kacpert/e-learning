class Api::V1::GroupsController < ApplicationController
  before_action :find_group, only: [:show, :update, :destroy]
  before_action :find_user, only: [:index]
  def show
  end

  def index
    @gr = GroupsUser.where(user_id: @user.id) 
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: group, status: 201, location: api_v1_group_url(group)
    else
    render json: { errors: group.errors }, status: 422
    end
  end

  def update
    if @group.update(group_params)
      render json: @group, status: 200, location: api_v1_group_url(@group)
    else
      render json: { errors: @group.errors }, status: 422
    end
  end

  def destroy
    @group.destroy
    render nothing: true, status: 204
  end

  private

  def find_user
    begin
      @user = User.find(params[:user_id])
    rescue Exception => e 
      render json: { errors: "can`t find user with id: #{params[:user_id]}" }, status: 412
    end
  end

  def find_group
    begin
      @group = Group.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find group with id: #{params[:id]}" }, status: 412
    end
  end

  def group_params
    params.permit(:name, :course_id, :user_ids => [])
  end
end

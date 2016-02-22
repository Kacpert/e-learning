class Api::V1::VideoLessonsController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :create, :destroy] 
  before_action :find_video_lesson, only: [:show, :update, :destroy]
  def show
  end

  def index
    @video_lessons = VideoLesson.all
  end

  def create
    @video_lesson = VideoLesson.new(video_lesson_params)
    if @video_lesson.save
      render :create, status: 201, location: api_v1_video_lesson_url(@video_lesson)
    else
    render json: { errors: @video_lesson.errors }, status: 422
    end
  end

  def update
    if @video_lesson.update(video_lesson_params)
      render json: @video_lesson, status: 200, location: api_v1_video_lesson_url(@video_lesson)
    else
      render json: { errors: @video_lesson.errors }, status: 422
    end
  end

  def destroy
    @video_lesson.destroy
    render nothing: true, status: 204
  end

  private

  def find_video_lesson
    begin
      @video_lesson = VideoLesson.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find video_lesson with id: #{params[:id]}" }, status: 412
    end
  end

  def video_lesson_params
    params.permit(:name, :description, :short_description, :video_url)
  end
end
class Api::V1::LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :update, :destroy]
  def show
  end

  def index
    @lessons = Lesson.all
  end

  def create
    lesson = Lesson.new(lesson_params)
    if lesson.save
      render json: lesson, status: 201, location: api_v1_lesson_url(lesson)
    else
    render json: { errors: lesson.errors }, status: 422
    end
  end

  def update
    if @lesson.update(lesson_params)
      render json: @lesson, status: 200, location: api_v1_lesson_url(@lesson)
    else
      render json: { errors: @lesson.errors }, status: 422
    end
  end

  def destroy
    @lesson.destroy
    render nothing: true, status: 204
  end

  private

  def find_lesson
    begin
      @lesson = Lesson.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find lesson with id: #{params[:id]}" }, status: 412
    end
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description, :video_url, :subtitles_url, :image)
  end
end
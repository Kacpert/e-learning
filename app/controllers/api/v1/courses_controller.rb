class Api::V1::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :update, :destroy]
  authorize_resource
  skip_authorize_resource only: [:sorted]
  respond_to :json

  def show
  end

  def index
    courses = Course.all
    render json: courses, status: 200
  end

  def sorted
    @categories = []
    SortingCourse.all.each do |filter|
      @categories << { category_title: filter.name, courses: SortingCoursesService.new(filter, current_user).courses }
    end
    render :sorted, status: 200
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: 201, location: api_v1_course_url(course)
    else
    render json: { errors: course.errors }, status: 422
    end
  end

  def update
    if @course.update(course_params)
      render json: @course, status: 200, location: api_v1_course_url(@course)
    else
      render json: { errors: @course.errors }, status: 422
    end
  end

  def destroy
    @course.destroy
    render nothing: true, status: 204
  end

  private

  def find_course
    begin
      @course = Course.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find course with id: #{params[:id]}" }, status: 412
    end
  end

  def course_params
    params.permit(:name, :description, :author, :order, :image, :temporal, :short_description, :image_url)
  end
end
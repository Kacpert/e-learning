class Api::V1::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :update, :destroy]
  def show
  end

  def index
    a = [
        {
            "category_title":"Your courses",
            "courses":[
                {
                    "id":1,
                    "title":"Small Satellites",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "joined":true,
                    "progress":"0.7"
                },
                {
                    "id":1,
                    "title":"Space Stations",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "joined":true,
                    "progress":"0.2"
                }
            ]
        },
        {
            "category_title":"Most Popular",
            "courses":[
                {
                    "id":3,
                    "title":"Small Satellites",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "joined":true,
                    "progress":"0.0"
                },
                {
                    "id":4,
                    "title":"Space Stations",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "joined":false,
                    "progress":"0.0"
                }
            ]
        },
        {
            "category_title":"Becuase you have ended Plazma Physics",
            "courses":[
                {
                    "id":5,
                    "title":"Small Satellites",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/satellites.jpg",
                    "joined":false,
                    "progress":"0.0"
                },
                {
                    "id":6,
                    "title":"Space Stations",
                    "img_big":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_medium":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "img_small":"https://dl.dropboxusercontent.com/u/47583785/e-learning/course/space-stations.jpg",
                    "joined":false,
                    "progress":"0.0"
                }
            ]
        }
    ]

    render json: a, status: 200
    #@courses = Course.all
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
    params.permit(:name, :description, :long_description, :author, :order, :image, :temporal)
  end
end
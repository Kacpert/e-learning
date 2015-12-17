class Api::V1::LessonsController < ActionController::Base
  def index
    @lessons = Course.find(params[:course_id]).lessons
  end
end

class Api::V1::CoursesController < ActionController::Base
  def show
    @course = Course.find_by(id: params[:id])
  end
end

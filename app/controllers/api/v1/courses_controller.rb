class Api::V1::CoursesController < ActionController::Base
  respond_to :json
  layout false

  def show
    @course = Course.find_by(id: params[:id])
  end

  def index
    respond_with Course.all
  end
end

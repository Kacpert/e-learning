class Api::V1::SectionsController < ActionController::Base
  before_action :find_section, only: [:show, :update, :destroy]
  def show
  end

  def index
    @sections = Section.all
  end

  def create
    section = Section.new(section_params)
    if section.save
      render json: section, status: 201, location: api_v1_section_url(section)
    else
    render json: { errors: section.errors }, status: 422
    end
  end

  def update
    if @section.update(section_params)
      render json: @section, status: 200, location: api_v1_section_url(@section)
    else
      render json: { errors: @section.errors }, status: 422
    end
  end

  def destroy
    @section.destroy
    render nothing: true, status: 204
  end

  private

  def find_section
    begin
      @section = Section.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find section with id: #{params[:id]}" }, status: 412
    end
  end

  def section_params
    params.require(:section).permit(:name, :short_description, :author, :image)
  end
end
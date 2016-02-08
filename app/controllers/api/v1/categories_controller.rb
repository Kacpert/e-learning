class Api::V1::CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
  end

  def index
    @caegorys = caegory.all
  end

  
end
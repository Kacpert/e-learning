class Api::V1::QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :update, :destroy]
  def show
  end

  def index
    @quizzes =  Quiz.all
  end

  def create
    quiz =  Quiz.new(quiz_params)
    if quiz.save
      render json: quiz, status: 201, location: api_v1_quiz_url(quiz)
    else
    render json: { errors: quiz.errors }, status: 422
    end
  end

  def update
    if @quiz.update(quiz_params)
      render json: @quiz, status: 200, location: api_v1_quiz_url(@quiz)
    else
      render json: { errors: @quiz.errors }, status: 422
    end
  end

  def destroy
    @quiz.destroy
    render nothing: true, status: 204
  end

  private

  def find_quiz
    begin
      @quiz =   Quiz.find(params[:id])
    rescue Exception => e 
      render json: { errors: "can`t find quiz with id: #{params[:id]}" }, status: 412
    end
  end

  def quiz_params
    params.require(:quiz).permit(:name, :title)
  end
end
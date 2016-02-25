class Api::V1::QuizzesController < ApplicationController
  before_action :find_quiz, only: [:update, :destroy]
  def show
   render json: {"id":3,"name":"Space term Quiz","description":"It is advanced quiz","image":{"small":"https://pbs.twimg.com/profile_images/593501983413112834/0ByVzPw6.jpg","medium":"https://pbs.twimg.com/profile_images/593501983413112834/0ByVzPw6.jpg"},"questions":[{"id":23,"question":"What mean 'Aphelion'","image":"url_to_image","type":"single_response","answer_time":0,"answers":[{"id":5,"text":" A unit for the measurement of wavelength. Equals one hundred millionth of a centimeter (0.003937 millionth of an inch)."},{"id":10,"text":"Pertaining to, or having the form of a ring."},{"id":8,"text":" That point in a solar orbit which is farthest from the Sun. "}]}]}, status: 200
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
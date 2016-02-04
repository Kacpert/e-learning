require 'rails_helper'

RSpec.describe Api::V1::QuizzesController, type: :controller do
  describe 'GET #index' do
      context 'when you have 15 quizzes' do
        before :each do 
          create_list(:quiz, 15)
          @first = Quiz.first
          get :index, format: :json
        end

          #should have value
        it { expect(response).to be_success }
        ['name', 'title'].each do |param|
          it ("json[0]#{param} eq @quiz.#{param}"){ expect(json[0][param]).to eq(@first[param]) }
        end
        #should not have
        ['created_at', 'updated_at'].each do |key|
          it { expect(json[0]).to_not have_key(key) }
        end
      end
  end

  describe 'POST #create' do
      context 'valid data' do
        before :each do 
          @attributes = attributes_for(:quiz)
          post :create, { quiz: @attributes }, format: :json  
        end
        it 'should create quiz end return localitation in header' do
          
          should respond_with 201
        end
        ['name', 'title'].each do |attri|
          it("#{attri} eq @quiz.#{attri}") { expect(json[attri]).to eq(@attributes[attri.to_sym]) }
        end
      end
      context 'invalid data' do
        it 'should create quiz end return localitation in header' do
          attributes = attributes_for(:quiz, name: '')
          post :create, { quiz: attributes }, format: :json  
          should respond_with 422
          expect(json_response[:errors][:name]).to include "can't be blank"
        end
      end
  end

  context 'with one quiz record' do
    before :each do 
      @quiz = create(:quiz)
    end

    describe 'GET #show json response'  do
      context 'good request' do
        before :each do
          get :show, id: @quiz.id, format: :json
        end

        #should have values
        it { expect(response).to be_success }
        ['name', 'title'].each do |param|
          it ("#{param} eq @quiz.#{param}"){ expect(json[param]).to eq(@quiz[param]) }
        end

        #should not have
        ['created_at', 'updated_at'].each do |key|
          it { expect(json).to_not have_key(key) }
        end
      end
      context 'bad request' do
        it 'should return error' do
          get :show, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find quiz with id: a1a')
        end
      end
    end

    describe 'PUT #update' do
      context 'valid data' do
        it 'should update quiz' do
          attributes = { name: 'name', title: 'title' }
          put :update, {id: @quiz.id, quiz: attributes }, format: :json
          @quiz.reload
          should respond_with 200
          attributes.each do |param|
             expect(json_response[param.first]).to eq(@quiz[param.first]) 
          end
        end
        it 'should return error when quiz id is bad' do
          put :update, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find quiz with id: a1a')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete quiz' do
        delete :destroy, id: @quiz.id, format: :json
        should respond_with 204
        expect(Quiz.all.size).to eq(0)
      end
    end 
  end
end
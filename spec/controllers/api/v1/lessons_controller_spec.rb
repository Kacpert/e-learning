require 'rails_helper'

RSpec.describe Api::V1::LessonsController, type: :controller do
  describe 'GET #index' do
      context 'when you have 15 lesson' do
        before :each do 
          create_list(:lesson, 15)
          @first = Lesson.first
          get :index, format: :json
        end

          #should have value
        it { expect(response).to be_success }
        ['name', 'description', 'video_url', 'subtitles_url'].each do |param|
          it ("json[0]#{param} eq @lesson.#{param}"){ expect(json[0][param]).to eq(@first[param]) }
        end
        it { expect(json[0]).to have_key('image_url') } 
        #should not have
        ['created_at', 'updated_at', 'image_file_name', 'image_updated_at',
         'image_content_type', 'image_file_size'].each do |key|
          it { expect(json[0]).to_not have_key(key) }
        end
      end
  end

  describe 'POST #create' do
      context 'valid data' do
        before :each do 
          @attributes = attributes_for(:lesson)
          post :create, { lesson: @attributes }, format: :json  
        end
        it 'should create lesson end return localitation in header' do
          
          should respond_with 201
        end
        ['name', 'description', 'image', 'video_url', 'subtitles_url'].each do |attri|
          it("#{attri} eq @lesson.#{attri}") { expect(json[attri]).to eq(@attributes[attri.to_sym]) }
        end
      end
      context 'invalid data' do
        it 'should create lesson end return localitation in header' do
          attributes = attributes_for(:lesson, name: '')
          post :create, { lesson: attributes }, format: :json  
          should respond_with 422
          expect(json_response[:errors][:name]).to include "can't be blank"
        end
      end
  end

  context 'with one lesson record' do
    before :each do 
      @lesson = create(:lesson)
    end

    describe 'GET #show json response'  do
      context 'good request' do
        before :each do
          get :show, id: @lesson.id, format: :json
        end

        #should have values
        it { expect(response).to be_success }
        ['name', 'description', 'video_url', 'subtitles_url'].each do |param|
          it ("#{param} eq @lesson.#{param}"){ expect(json[param]).to eq(@lesson[param]) }
        end
        it { expect(json).to have_key('image_url') } 

        #should not have
        ['created_at', 'updated_at', 'image_file_name', 'image_updated_at',
         'image_content_type', 'image_file_size'].each do |key|
          it { expect(json).to_not have_key(key) }
        end
      end
      context 'bad request' do
        it 'should return error' do
          get :show, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find lesson with id: a1a')
        end
      end
    end

    describe 'PUT #update' do
      context 'valid data' do
        it 'should update lesson' do
          attributes = { name: 'name', description: 'description', video_url: 'video_url', subtitles_url: 'subtitles_url' }
          put :update, {id: @lesson.id, lesson: attributes }, format: :json
          @lesson.reload
          should respond_with 200
          attributes.each do |param|
             expect(json_response[param.first]).to eq(@lesson[param.first]) 
          end
        end
        it 'should return error when lesson id is bad' do
          put :update, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find lesson with id: a1a')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete lesson' do
        delete :destroy, id: @lesson.id, format: :json
        should respond_with 204
        expect(Lesson.all.size).to eq(0)
      end
    end 
  end
end
require 'rails_helper'

RSpec.describe Api::V1::VideoLessonsController, type: :controller do
  before :each do
    request.headers['Authorization'] = create(:admin).auth_token
  end


  describe 'GET #index' do
      context 'when you have 15 video_lessons' do
        before :each do 
          create_list(:video_lesson, 15)
          @first = VideoLesson.first
          get :index, format: :json
        end

          #should have values
        it { expect(response).to be_success }
        ['id', 'name', 'description', 'short_description', 'video_url'].each do |param|
          it ("json[0]#{param} eq @video_lesson.#{param}"){ expect(json[0][param]).to eq(@first[param]) }
        end
        it { expect(json[0]).to have_key('image') } 
        #should not have
        ['created_at', 'updated_at', 'image_file_name', 'image_updated_at',
         'image_content_type', 'image_file_size'].each do |key|
          it { expect(json[0]).to_not have_key(key) }
        end
      end
  end

  describe 'POST #create' do
      context 'with valid data' do
        before :each do
          @attributes = attributes_for(:video_lesson)
          post :create, @attributes, format: :json  
        end
        it { should respond_with 201 }
        it('should return location in header'){ expect(response.header['Location']).to eq(api_v1_video_lesson_url(VideoLesson.first)) }
        [:name, :description, :short_description, :video_url].each do |attr|
          it("created response json[#{attr}]"){ expect(json_response[attr]).to eq(@attributes[attr]) }
        end
      end
  end
  context 'with one video_lesson record' do
    before do 
      @video_lesson = create(:video_lesson)
    end

    describe 'GET #show json response'  do
      context 'good request' do
        before :each do
          get :show, id: @video_lesson.id, format: :json
        end

        #should have values
        it { expect(response).to be_success }
        ['name', 'short_description', 'id', 'order', 'course_id'].each do |param|
          it ("#{param} eq @video_lesson.#{param}"){ expect(json[param]).to eq(@video_lesson[param]) }
        end
        it { expect(json).to have_key('image') } 

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
          expect(json_response[:errors]).to eq('can`t find video_lesson with id: a1a')
        end
      end
    end

    describe 'PUT #update' do
      context 'valid data' do
        it 'should update video_lesson' do
          attributes = { name: 'name', description: 'description', short_description: 'short_description', video_url: 'www.video_ur.com' }
          put :update, {id: @video_lesson.id, video_lesson: attributes }, format: :json
          @video_lesson.reload
          should respond_with 200
          attributes.each do |param|
             expect(json_response[param.first]).to eq(@video_lesson[param.first]) 
          end
        end
        it 'should return error when video_lesson id is bad' do
          put :update, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find video_lesson with id: a1a')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete video_lesson' do
        delete :destroy, id: @video_lesson.id, format: :json
        should respond_with 204
        expect(VideoLesson.all.size).to eq(0)
      end
    end 
  end
end

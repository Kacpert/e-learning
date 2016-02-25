require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  before :each do
    @admin = create(:user, role: 'admin')
    request.headers['Authorization'] = @admin.auth_token
  end



  describe 'GET #sorted' do
      before :each do 
        create_list(:sorting_course, 2)
        create_list(:course, 5)
        get :sorted, format: :json
      end
        #should have values
      it { expect(response).to be_success }
      ['name', 'description', 'short_description', 'author', 'id'].each do |param|
        it ("json should have key: json[0]['courses'][0][#{param}]"){ expect(json[0]['courses'][0]).to have_key(param) }
      end
      it { expect(json[0]).to have_key('category_title') } 
      #should not have
      # ['created_at', 'updated_at', 'image_file_name', 'image_updated_at',
      #  'image_content_type', 'image_file_size'].each do |key|
      #   it { expect(json[0]).to_not have_key(key) }
      # end
  end

  describe 'POST #create' do
      context 'valid data' do
        before :each do
          @attributes = attributes_for(:course)
          section_attributes = { sections_attributes: { name: 'name', description: 'description' } }
          post :create, @attributes.merge(section_attributes), format: :json  
        end

        it { should respond_with 201 }
        it 'should create course end return localitation in header' do
          [:image, :name, :description, :short_description, :author, :user, :categories, :order, :temporal].each do |attr|
            expect(json_response[attr]).to eq(@attributes[attr])
          end
        end
        it 'should create nasted section' do
          section = Section.first
          expect(section.name).to eq('name')
          expect(section.description).to eq('description')
        end
      end
      context 'invalid data' do
        it 'should create course end return localitation in header' do
          attributes = attributes_for(:course, name: '')
          post :create, attributes, format: :json  
          should respond_with 422
          expect(json_response[:errors][:name]).to include "can't be blank"
        end
      end
  end

  context 'with one course record' do
    before do 
      @course = create(:course)
    end

    describe 'GET #show json response'  do
      context 'good request' do
        before :each do
          get :show, id: @course.id, format: :json
        end

        #should have values
        it { expect(response).to be_success }
        ['name', 'description', 'short_description', 'author', 'order', 'id', 'temporal'].each do |param|
          it ("#{param} eq @course.#{param}"){ expect(json[param]).to eq(@course[param]) }
        end
        it { expect(json).to have_key('image_url') } 
        it { expect(json).to have_key('sections') } 

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
          expect(json_response[:errors]).to eq('can`t find course with id: a1a')
        end
      end
    end

    describe 'PUT #update' do
      context 'valid data' do 
        before do
          @attributes = {id: @course.id, name: 'name', description: 'description', short_description: 'short_description', author: 'author', order: 14 }
          put :update, @attributes, format: :json
          @course.reload
        end       
        it { should respond_with 200 }
        { name: 'name', description: 'description', short_description: 'short_description', author: 'author', order: 14 }.each do |param|
          it("after update json[#{param.first}] should be eq #{param.second}") do
            expect(json_response[param.first]).to eq(param.second) 
          end
        end
      end
        it 'should return error when course id is bad' do
          put :update, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find course with id: a1a')
        end
    end

    describe 'DELETE #destroy' do
      it 'should delete course' do
        delete :destroy, id: @course.id, format: :json
        should respond_with 204
        expect(Course.all.size).to eq(0)
      end
    end 
  end
end
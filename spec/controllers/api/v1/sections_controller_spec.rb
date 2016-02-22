require 'rails_helper'

RSpec.describe Api::V1::SectionsController, type: :controller do
  before :each do
    request.headers['Authorization'] = create(:admin).auth_token
  end


  describe 'GET #index' do
      context 'when you have 15 sections' do
        before :each do 
          create_list(:section, 15)
          @first = Section.first
          get :index, format: :json
        end
          #should have values
        it { expect(response).to be_success }
        ['name', 'description', 'id', 'order', 'course_id'].each do |param|
          it ("json[0]#{param} eq @section.#{param}"){ expect(json[0][param]).to eq(@first[param]) }
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
          @attributes = attributes_for(:section)
          post :create, @attributes, format: :json  
        end
        it { should respond_with 201 }
        it('should return location in header'){ expect(response.header['Location']).to eq(api_v1_section_url(Section.first)) }
        [:name, :description, :order, :course_id].each do |attr|
          it("created response json[#{attr}]"){ expect(json_response[attr]).to eq(@attributes[attr]) }
        end
      end
  end

  context 'with one section record' do
    before do 
      @section = create(:section)
    end

    describe 'GET #show json response'  do
      context 'good request' do
        before :each do
          get :show, id: @section.id, format: :json
        end

        #should have values
        it { expect(response).to be_success }
        ['name', 'description', 'id', 'order', 'course_id'].each do |param|
          it ("#{param} eq @section.#{param}"){ expect(json[param]).to eq(@section[param]) }
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
          expect(json_response[:errors]).to eq('can`t find section with id: a1a')
        end
      end
    end

    describe 'PUT #update' do
      context 'valid data' do
        it 'should update section' do
          attributes = { name: 'name', description: 'description', order: 4, }
          put :update, {id: @section.id, section: attributes }, format: :json
          @section.reload
          should respond_with 200
          attributes.each do |param|
             expect(json_response[param.first]).to eq(@section[param.first]) 
          end
        end
        it 'should return error when section id is bad' do
          put :update, id: 'a1a', format: :json
          should respond_with 412
          expect(json_response[:errors]).to eq('can`t find section with id: a1a')
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete section' do
        delete :destroy, id: @section.id, format: :json
        should respond_with 204
        expect(Section.all.size).to eq(0)
      end
    end 
  end
end

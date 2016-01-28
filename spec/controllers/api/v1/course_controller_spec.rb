require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  before(:each) do
    @course = create(:course)
  end  

  describe 'GET #show json response should'  do
    before :each do
      get :show, id: @course.id, format: :json
    end

    #should have values
    it { expect(response).to be_success }
    ['name', 'description', 'long_description', 'author', 'order', 'image_url', 'id'].each do |param|
      it{ expect(json[param]).to eq(@course[param]) }
    end

    #should not have
    ['created_at', 'updated_at', 'image_file_name', 'image_updated_at',
     'image_content_type', 'image_file_size'].each do |key|
      it { expect(json).to_not have_key(key) }
    end
  end

  describe 'GET #index' do
  end
end


require "rails_helper"

RSpec.describe Course, :type => :request do
  before do
    @course = FactoryGirl.create(:course)
    get "/api/v1/courses/#{@course.id}"
  end

  describe "API" do
    context "#show" do
      it 'responds with 200 status' do
        expect(response).to be_success
      end

      it 'should have valid name' do
        expect(json['course']['name']).to eq('New course')
      end

      it 'should have valid description' do
        expect(json['course']['description']).to eq('some desc')
      end

      it 'should have valid image_url' do
        expect(json['course']['image_url']).to match(/http|https/)
      end
    end
  end
end

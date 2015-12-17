
require "rails_helper"

RSpec.describe "Courses api", :type => :request do

  describe "Course" do
    it 'sends a specyfic course' do
      course = FactoryGirl.create(:course)
      get "/api/v1/courses/#{course.id}"

      # test for the 200 status-code
      expect(response).to be_success
      expect(json['course']['name']).to eq('New course')
      expect(json['course']['description']).to eq('some desc')
      expect(json['course']['image_url']).to match(/http|https/)
    end
  end
end

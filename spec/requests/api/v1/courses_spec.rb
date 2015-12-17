
require "rails_helper"

RSpec.describe "Course api", :type => :request do

  describe "Course" do
    it 'sends a specyfic course' do
      course = FactoryGirl.create(:course)
      get "/api/v1/courses/#{course.id}"

      # test for the 200 status-code
      expect(response).to be_success
    end
  end
end

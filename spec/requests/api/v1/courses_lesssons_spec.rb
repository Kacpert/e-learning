require "rails_helper"

RSpec.describe "Lesson via courses api", :type => :request do
  before do
    @course = create(:course, lessons: create_list(:lesson, 7))
  end

  describe "when #show" do
    it "should respond with success and status 200" do
      get "/api/v1/courses/#{@course.id}/lessons"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should return lesson from specyfic course" do
      get "/api/v1/courses/#{@course.id}/lessons"

      expect(json['lessons'].length).to eq(7)
    end
  end
end

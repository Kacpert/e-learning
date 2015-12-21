require "rails_helper"

RSpec.describe "Lesson api", :type => :request do
  before do
    @lesson = create(:lesson, test: create_list(:lesson_test, 10))
  end

  describe "when #show" do
    it "should respond with success and status 200" do
      get "/api/v1/lessons/#{@lesson.id}"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should return specyfic lesson" do
      get "/api/v1/lessons/#{@lesson.id}"

      expect(json['lesson'].name).to eq(@lesson.name)
      expect(json['lesson'].lesson_type).to eq(test)
    end

    it 'should return lesson with contetnt or test' do 
      Test.
      get "/api/v1/lessons/#{@lesson.id}?with_content_or_tests"


    end
  end
end

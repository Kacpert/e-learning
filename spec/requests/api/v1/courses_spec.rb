
require "rails_helper"

RSpec.describe Course, :type => :request do
  before do
    Course.all.destroy_all
    @courses = FactoryGirl.create_list(:course, 15)
  end

  describe "when #show" do
    it 'should respond with success and status 200' do
      get "/api/v1/courses/#{@courses.first.id}"

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should have valid name' do
      get "/api/v1/courses/#{@courses.first.id}"

      expect(json['course']['name']).to eq('New course')
    end

    it 'should have valid description' do
      get "/api/v1/courses/#{@courses.first.id}"

      expect(json['course']['description']).to eq('some desc')
    end

    it 'should have valid image_url' do
      get "/api/v1/courses/#{@courses.first.id}"

      expect(json['course']['image_url']).to match(/http|https/)
    end
  end

  describe "when #index" do
    it 'should respond with success and status 200' do
      get '/api/v1/courses'

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should contain 15 courses' do
      get '/api/v1/courses'

      expect(json['courses'].length).to eq(15)
    end

    it "should contain course with properly assigned values" do
      get '/api/v1/courses'

      expect(json['courses'][0]['name']).to eq('New course')
      expect(json['courses'][0]['image_url']).to match(/http|https/)
    end
  end
end

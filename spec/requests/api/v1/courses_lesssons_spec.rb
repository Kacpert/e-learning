require "rails_helper"

RSpec.describe "Lesson via courses api", :type => :request do

  it 'get lesson from specyfic course' do
    course = create(:course)
    lessons = create_list(:lesson, 7)
    course << lessons
    get "/api/v1/courses/#{course.id}/lessons"

    # test for the 200 status-code
    expect(response).to be_success
    expect(json['lessons'].length).to eq(7)
  end
end

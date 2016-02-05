require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do

  describe "POST #create" do
    it 'should create group with users asign to course' do
      course = create(:course)
      users = create_list(:user, 4)
      user_ids = users.map(&:id)
      get :create, {name: 'my_group', course_id: course.id, user_ids: user_ids}
      group = Group.first
      expect(json['name']).to eq('my_group')
      expect(json['user_ids']).to eq(user_ids)
      expect(json['course_id']).to eq(course.id)
      expect(group.users.size).to eq(4)
      expect(group.course).to eq(course)
      should respond_with 201
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #   end
  # end
end

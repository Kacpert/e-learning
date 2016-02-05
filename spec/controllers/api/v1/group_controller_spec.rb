require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do

  describe "POST #create" do
    it 'should create group with users asign to course' do
      course = create(:course)
      users = create_list(:user, 4)
      get :create, {name: 'my_group', course_id: course.id, user_ids: users.map(&:id)}
      group = Group.first
      expect(group.name).to eq('my_group')
      expect(group.users.size).to eq(4)
      expect(group.course).to eq(course)
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #   end
  # end
end

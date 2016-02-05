require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :controller do
  describe 'POST #create' do
    before :each do
      @users = create_list(:user, 4)
      @group = create(:group, user_ids: @users.map(&:id), course: create(:course)) 
    end

    it "should send to user message" do
      u_first = @users.first
      sign_in u_first
      u_second = @users.second
      post :create, { user_ids: [ u_first.id, u_second.id ], text: 'txt' }, format: :json
      expect(u_first.messages.first.text).to eq('txt')
      expect(u_second.messages.first.text).to eq('txt')
      post :create, { user_ids: [ u_first.id, u_second.id ], text: 'tt' }, format: :json
      get :index
      expect(json_response.first[:text]).to eq('txt')
      expect(json_response.second[:text]).to eq('tt')
      put :update, { id: u_first.messages.first.id, displayed: true }, format: :json
      get :index
      #expect(json.first[:text]).to eq('tt')


    end

  end
end

require 'rails_helper'

RSpec.describe Api::V1::ConversationsController, type: :controller do
  before(:each) do
   request.headers['Content-Type'] = 'application/json' 
   @user = create(:user)
   request.headers['Authorization'] = @user.auth_token 
 end

  describe 'POST #create' do
    context 'When it is succefully created' do
      before(:each) do
        @users = create_list(:user, 4)
        @user_ids = @users.map(&:id)
        post :create, { user_ids: @user_ids }, format: :json
      end
      it 'render created record as json' do
        expect(json["id"]).to eq(Conversation.first.id)
        expect(json["user_ids"]).to eq(@user_ids + [@user.id])
      end
      it { should respond_with 201 }
    end
  end

end

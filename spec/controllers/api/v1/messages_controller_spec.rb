# require 'rails_helper'

# RSpec.describe Api::V1::MessagesController, type: :controller do
#     before :each do
#       @conversation = create(:conversation)
#       @author = @conversation.users.first
#       @user = @conversation.users.second
#       request.headers['Authorization'] = @author.auth_token
#     end
  
#   it('created conversation should have 4 users'){ expect(@conversation.users.size).to eq(4) }

#   context 'with replay option' do
#     describe 'POST #create' do
#       context 'when is successfully created' do
#         it 'with active conversation return information' do
#           post :create, { user_ids: [ @user.id ], text: 'txt', conversation_id: @conversation.id }, format: :json
#           expect(@user.messages.first.text).to eq('txt')
#           expect(Message.first.user).to eq(@author)
#           expect(json['conversation_id']).to eq(@conversation.id)
#           expect(Conversation.first.updated_at).to_not eq(@conversation.updated_at)
#         end
#         it 'without conversation create conv and return information' do
#           post :create, { user_ids: [ @user.id ], text: 'txt'}, format: :json
#           expect(@user.messages.first.text).to eq('txt')
#           expect(Message.first.user).to eq(@author)
#           expect(json['conversation_id']).to eq(Conversation.second.id)
#         end
#       end
#     end
#   end
# end

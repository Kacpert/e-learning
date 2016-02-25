require 'rails_helper'

RSpec.describe ComplementMessageDataService, type: :service do

  describe '#user_ids' do
      it 'when in params 2 user_ids + current_user id then should give back 3 size array' do
        params = { user_ids: [6,9] }
        complement = ComplementMessageDataService.new(params, create(:user))
        expect(complement.user_ids.size).to eq(3)
        expect(complement.user_ids).to include(6)      
      end
  end

  describe '#create_conversation' do
      it 'when have 2 uses(current and in params) method create with these users conversation' do
        params = { user_ids: [create(:user).id] }
        complement = ComplementMessageDataService.new(params, create(:user))
        expect(complement.create_conversation.users.size).to eq(2)
      end
  end

  describe '#find_or_create_conversation_and_check_sender_permitted?' do
      it "if user have parmission" do
        params = { conversation_id: create(:conversation).id }
        complement = ComplementMessageDataService.new(params, User.first)
        expect(complement.find_or_create_conversation_and_check_sender_permitted?).to eq(true)
      end

      it "if there is no conversation should create new and send true" do
        params = { }
        complement = ComplementMessageDataService.new(params, create(:user))
        expect(complement.find_or_create_conversation_and_check_sender_permitted?).to eq(true)
      end

      it "if conversation don`t exist" do
        params = { conversation_id: 50 }
        complement = ComplementMessageDataService.new(params, create(:user))
        expect(complement.find_or_create_conversation_and_check_sender_permitted?).to eq('User try send message to non-existent conversation')
      end 

      it "if user not have parmission" do
        params = { conversation_id: create(:conversation).id }
        complement = ComplementMessageDataService.new(params, create(:user))
        expect(complement.find_or_create_conversation_and_check_sender_permitted?).to eq('User is not permitted to send in this conversation messages.')
      end
  end

  # describe '#find_users_by_logins'

  describe '#new_message' do
      # it "when valid data" do
      #   params = { user_ids: [6,9], text: 'text',  }
      #   complement = ComplementMessageDataService.new(params, create(:user))
      #   expect(complement.find_or_create_conversation_and_check_sender_permitted?).to eq('User is not permitted to send in this conversation messages.')
      # end
  end
end
  
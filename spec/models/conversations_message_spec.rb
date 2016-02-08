require 'rails_helper'

RSpec.describe ConversationsMessage, type: :model do
  context 'parametrs' do 
    it { should respond_to(:user) }
    it { should respond_to(:message) }
  end
end

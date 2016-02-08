require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context 'parametrs' do
    it { should respond_to(:users) }
    it { should respond_to(:conversations_users)   }
    it { should respond_to(:messages) }
  end
end

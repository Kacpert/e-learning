require 'rails_helper'

RSpec.describe ConversationsUser, type: :model do
  it { should respond_to(:conversation) }
  it { should respond_to(:user) }
end

require 'rails_helper'

RSpec.describe MessagesUser, type: :model do
  it { should respond_to(:user) }
  it { should respond_to(:message) }
end

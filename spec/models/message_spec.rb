require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'parametrs' do
    it { should respond_to(:text)         }
    it { should respond_to(:user)         }
    it { should respond_to(:conversation) }
  end
end

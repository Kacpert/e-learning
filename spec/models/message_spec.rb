require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'parametrs' do
    it { should respond_to(:text)           }
    it { should respond_to(:user)           }
    it { should respond_to(:users)          }
    it { should respond_to(:messages_users) }
    it { should respond_to(:group)          }
  end
end

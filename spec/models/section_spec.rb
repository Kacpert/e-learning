require 'rails_helper'

RSpec.describe Section, type: :model do
  context 'parametrs' do
    it { should respond_to(:name)        }
    it { should respond_to(:order)       }
    it { should respond_to(:image)       }
    it { should respond_to(:course)      }
    it { should respond_to(:course_id)   }
    it { should respond_to(:description) }
  end
end

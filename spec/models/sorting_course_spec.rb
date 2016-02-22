require 'rails_helper'

RSpec.describe SortingCourse, type: :model do
  context 'parametrs' do
    it { should respond_to(:section)   }
    it { should respond_to(:component) }
  end
end

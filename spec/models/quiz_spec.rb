require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context 'parametrs' do
    it { should respond_to(:name) }
    it { should respond_to(:title) }
  end

  context 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title)}
  end
end

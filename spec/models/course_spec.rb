require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = create(:course)
    @course.lessons << [create(:lesson), create(:lesson, name: 'other')]
  end

  describe "when #new" do
    it 'should have valid name' do
      expect(@course.name).to eq('New course')
    end

    it 'should have valid description' do
      expect(@course.description).to eq('some desc')
    end

    it 'should have two lessons' do
      expect(@course.lessons.size).to eq(2)
    end
  end

  describe "when #new" do
    it "should not be created without name and description" do
      expect(build(:lesson, name: nil, description: nil)).to_not be_valid
    end
  end
end

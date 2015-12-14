require 'rails_helper'

RSpec.describe Lesson, type: :model do
    describe 'create' do
      it 'valid lesson' do
        lesson = create(:lesson)
        expect(lesson.name).to eq('lesson name')
        expect(lesson.description).to eq('a b c d sdw' * 250)
      end
    end
    it 'shouldn`t create without name and description' do
      expect(build(:lesson, name: nil, description: nil)).to_not be_valid
    end


  describe 'update' do
    it 'name' do
      lesson = create(:lesson)
      lesson.update(name: 'new name')
      expect(lesson.name).to eq('new name')
    end

    it 'description' do
      lesson = create(:lesson)
      lesson.update(description: 'abc')
      expect(lesson.description).to eq('abc')
    end
  end

  it 'should be destroy' do
    lesson = create(:lesson)
    lesson.destroy
    expect(Lesson.all.size).to eq(0)
  end
end

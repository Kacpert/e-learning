require 'rails_helper'

RSpec.describe LessonContent, type: :model do
    describe 'create' do

      it 'valid lesson content connect with lesson' do
        lesson_content = create(:lesson_content)
        expect(lesson_content.name).to eq('content name')
        expect(lesson_content.description).to eq('a b c d sdw' * 50)
        expect(lesson_content.lesson.name).to eq('lesson name')
      end
    end

    it 'shouldn`t create without name and description' do
      expect(build(:lesson_content, name: '', description: '')).to_not be_valid
    end

  describe 'update' do
    it 'name' do
      lesson_content = create(:lesson_content)
      lesson_content.update(name: 'new name')
      expect(lesson_content.name).to eq('new name')
    end

    it 'description' do
      lesson_content = create(:lesson_content)
      lesson_content.update(description: 'abc')
      expect(lesson_content.description).to eq('abc')
    end
  end

  it 'should be destroy' do
    lesson_content = create(:lesson_content)
    lesson_content.destroy
    expect(LessonContent.all.size).to eq(0)
  end
end

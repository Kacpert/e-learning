require 'rails_helper'

RSpec.describe LessonTest, type: :model do
    describe 'create' do

      it 'valid lesson test connect with lesson' do
        lesson_test = create(:lesson_test)
        expect(lesson_test.name).to eq('test name')
        expect(lesson_test.question).to eq('a b c d sdw' * 10)
        expect(lesson_test.lesson.name).to eq('lesson name')
      end
    end

    it 'shouldn`t create without name and question' do
      expect(build(:lesson_test, name: '', question: '')).to_not be_valid
    end

  describe 'update' do
    it 'name' do
      lesson_test = create(:lesson_test)
      lesson_test.update(name: 'new name')
      expect(lesson_test.name).to eq('new name')
    end

    it 'question' do
      lesson_test = create(:lesson_test)
      lesson_test.update(question: 'abc')
      expect(lesson_test.question).to eq('abc')
    end
  end

  it 'should be destroy' do
    lesson_test = create(:lesson_test)
    lesson_test.destroy
    expect(LessonTest.all.size).to eq(0)
  end
end

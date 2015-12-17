require 'rails_helper'

RSpec.describe LessonTestAnswer, type: :model do
    describe 'create' do

      it 'valid lesson test connect with lesson' do
        lesson_test_answer = create(:lesson_test_answer)
        expect(lesson_test_answer.description).to eq('sample answer')
        expect(lesson_test_answer.correct).to eq(true)
        expect(lesson_test_answer.lesson_test.name).to eq('test name')
      end
    end

    it 'shouldn`t create without name and description' do
      expect(build(:lesson_test_answer, description: '')).to_not be_valid
    end

  describe 'update' do
    it 'correct' do
      lesson_test_answer = create(:lesson_test_answer)
      lesson_test_answer.update(correct: false)
      expect(lesson_test_answer.correct).to eq(false)
    end

    it 'description' do
      lesson_test_answer = create(:lesson_test_answer)
      lesson_test_answer.update(description: 'abc')
      expect(lesson_test_answer.description).to eq('abc')
    end
  end

  it 'should be destroy' do
    lesson_test_answer = create(:lesson_test_answer)
    lesson_test_answer.destroy
    expect(LessonTestAnswer.all.size).to eq(0)
  end
end

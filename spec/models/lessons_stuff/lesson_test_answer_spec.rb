require 'rails_helper'

RSpec.describe LessonTestAnswer, type: :model do
  before do
    @lesson_test_answer = create(:lesson_test_answer)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid description" do
        expect(@lesson_test_answer.description).to eq('sample answer')
      end

      it "should have valid correct" do
        expect(@lesson_test_answer.correct).to eq(true)
      end

      it "should have valid lesson_test name" do
        expect(@lesson_test_answer.lesson_test.name).to eq('test name')
      end
    end

    context 'invalid' do
      it 'should not be valid with invalid name and question' do
        expect(build(:lesson_test_answer, description: '', correct: nil)).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid description" do
      @lesson_test_answer.update(description: 'new name')
      expect(@lesson_test_answer.description).to eq('new name')
    end

    it "should have valid correct" do
      @lesson_test_answer.update(correct: false)
      expect(@lesson_test_answer.correct).to eq(false)
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @lesson_test_answer.destroy
      expect(LessonTestAnswer.all.size).to eq(0)
    end
  end
end

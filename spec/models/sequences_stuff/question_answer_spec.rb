require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  before do
    @question_answer = create(:question_answer)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid description" do
        expect(@question_answer.description).to eq('sample answer')
      end

      it "should have valid correct" do
        expect(@question_answer.correct).to eq(true)
      end

      it "should have valid question question" do
        expect(@question_answer.question.question).to eq('sample question')
      end
    end

    context 'invalid' do
      it 'should not be valid with invalid name and question' do
        expect(build(:question_answer, description: '', correct: nil)).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid description" do
      @question_answer.update(description: 'new desc')
      expect(@question_answer.description).to eq('new desc')
    end

    it "should have valid correct" do
      @question_answer.update(correct: false)
      expect(@question_answer.correct).to eq(false)
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @question_answer.destroy
      expect(QuestionAnswer.all.size).to eq(0)
    end
  end
end

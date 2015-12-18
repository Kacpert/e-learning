require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    QuestionAnswer.all.destroy_all
    @question = create(:question, question_answers: create_list(:question_answer, 4))
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid question" do
        expect(@question.question).to eq('sample question')
      end

      it 'should have connected 4 question answers' do
        expect(@question.question_answers.size).to eq(4)
      end

      it "should have connection with test" do
        expect(@question.test.name).to eq('test name')
      end
    end

    context 'invalid' do
      it 'should not be valid without name' do
        expect(build(:question, question: '')).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid question" do
      @question.update(question: 'abc')
      expect(@question.question).to eq('abc')
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      Question.all.destroy_all
      expect(Question.all.size).to eq(0)
    end
  end
end

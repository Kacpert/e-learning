require 'rails_helper'

RSpec.describe LessonTest, type: :model do
  before do
    @lesson_test = create(:lesson_test)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid name" do
        expect(@lesson_test.name).to eq('test name')
      end

      it "should have valid question" do
        expect(@lesson_test.question).to eq('a b c d sdw' * 10)
      end

      it "should have valid lesson name" do
        expect(@lesson_test.lesson.name).to eq('lesson name')
      end
    end

    context 'invalid' do
      it 'should not be valid with invalid name and question' do
        expect(build(:lesson_test, name: '', question: '')).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid name" do
      @lesson_test.update(name: 'new name')
      expect(@lesson_test.name).to eq('new name')
    end

    it "should have valid question" do
      @lesson_test.update(question: 'abc')
      expect(@lesson_test.question).to eq('abc')
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @lesson_test.destroy
      expect(LessonTest.all.size).to eq(0)
    end
  end
end

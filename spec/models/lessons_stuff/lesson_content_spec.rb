require 'rails_helper'

RSpec.describe LessonContent, type: :model do
  before do
    @lesson_content = create(:lesson_content)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid name" do
        expect(@lesson_content.name).to eq('content name')
      end

      it "should have valid description" do
        expect(@lesson_content.description).to eq('a b c d sdw' * 50)
      end

      it "should have valid lesson name" do
        expect(@lesson_content.lesson.name).to eq('lesson name')
      end
    end

    context 'invalid' do
      it 'should not be valid with invalid name and description' do
        expect(build(:lesson_content, name: '', description: '')).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid name" do
      @lesson_content.update(name: 'new name')
      expect(@lesson_content.name).to eq('new name')
    end

    it "should have valid description" do
      @lesson_content.update(description: 'abc')
      expect(@lesson_content.description).to eq('abc')
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @lesson_content.destroy
      expect(LessonContent.all.size).to eq(0)
    end
  end
end

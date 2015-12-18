require 'rails_helper'

RSpec.describe Lesson, type: :model do
  before do
    @lesson = create(:lesson)
    create(:sequence, sequence_type: 'lesson', foreign_key: @lesson.id)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid name" do
        expect(@lesson.name).to eq('lesson name')
      end

      it "should have valid description" do
        expect(@lesson.description).to eq('a b c d sdw' * 50)
      end

      it "should have valid content" do
        expect(@lesson.content).to eq('a b c d sdw' * 250)
      end

      it "should have valid sequence" do
        expect(@lesson.sequences.first.order).to eq(1)
      end
    end

    context 'invalid' do
      it 'should not be valid with invalid name and description' do
        expect(build(:lesson, name: '', description: '', content: '')).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid name" do
      @lesson.update(name: 'new name')
      expect(@lesson.name).to eq('new name')
    end

    it "should have valid description" do
      @lesson.update(description: 'abc')
      expect(@lesson.description).to eq('abc')
    end

    it "should have valid content" do
      @lesson.update(content: 'new conetne')
      expect(@lesson.content).to eq('new conetne')
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @lesson.destroy
      expect(Lesson.all.size).to eq(0)
    end
  end
end

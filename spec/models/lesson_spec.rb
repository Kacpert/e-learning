require 'rails_helper'

RSpec.describe Lesson, type: :model do
  before do
    @lesson = create(:lesson)
    @course_1  = create(:course, lessons: [@lesson])
    @course_2  = create(:course, name: 'sample', lessons: [@lesson])
  end

  describe "when #new" do
    it "should have valid name" do
      expect(@lesson.name).to eq('lesson name')
    end

    it "should have valid description" do
      expect(@lesson.description).to eq('a b c d sdw' * 250)
    end

    context 'with courses' do
      it "should have two courses" do
        expect(@course_1.lessons.first).to eq(@lesson)
        expect(@course_2.lessons.first).to eq(@lesson)
      end
    end
  end

  describe "when #new" do
    it 'shouldn`t create without name and description' do
      expect(build(:lesson, name: nil, description: nil)).to_not be_valid
    end

    it 'should have valid type of "test"' do
      expect(build(:lesson, lesson_type: 'test')).to be_valid
    end

    it 'should have valid type of "content"' do
      expect(build(:lesson, lesson_type: 'content')).to be_valid
    end

    it 'should not have valid type of "contents"' do
      expect(build(:lesson, lesson_type: 'contents')).to_not be_valid
    end

    it 'should not have valid type of "cos"' do
      expect(build(:lesson, lesson_type: 'cos')).to_not be_valid
    end
  end

  describe "when #update" do
    it "should be updated with new name" do
      @lesson.update(name: 'new name')
      expect(@lesson.name).to eq('new name')
    end

    it "should be updated with new description" do
      @lesson.update(description: 'abc')
      expect(@lesson.description).to eq('abc')
    end
  end

  describe "when #destroy" do
    it "should be deletable" do
      @lesson.destroy
      expect(Lesson.all.size).to eq(0)
    end
  end
end

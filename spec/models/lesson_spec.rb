require 'rails_helper'

RSpec.describe Lesson, type: :model do
    describe 'create' do
      it 'valid lesson' do
        lesson = create(:lesson)
        expect(lesson.name).to eq('lesson name')
        expect(lesson.description).to eq('a b c d sdw' * 250)
      end
    end
    it 'shouldn`t create without name and description' do
      expect(build(:lesson, name: nil, description: nil)).to_not be_valid
    end
    it 'should have valid type' do
      expect(build(:lesson, type: 'test')).to         be_valid
      expect(build(:lesson, type: 'content')).to      be_valid
      expect(build(:lesson, type: 'cos')).to_not      be_valid
      expect(build(:lesson, type: 'contents')).to_not be_valid
    end


  it 'should be in two diffrent courses' do
    course_1  = create(:course)
    course_2  = create(:course, name: 'smapl')
    lesson    = create(:lesson)

    course_1.lessons << lesson
    course_2.lessons << lesson

    expect(Course.first.lessons.first).to eq(lesson)
    expect(Course.second.lessons.first).to eq(lesson)
  end


  describe 'update' do
    it 'name' do
      lesson = create(:lesson)
      lesson.update(name: 'new name')
      expect(lesson.name).to eq('new name')
    end

    it 'description' do
      lesson = create(:lesson)
      lesson.update(description: 'abc')
      expect(lesson.description).to eq('abc')
    end
  end

  it 'should be destroy' do
    lesson = create(:lesson)
    lesson.destroy
    expect(Lesson.all.size).to eq(0)
  end
end

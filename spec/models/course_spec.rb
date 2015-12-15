require 'rails_helper'

RSpec.describe Course, type: :model do

    describe 'create' do
      it 'valid course' do
        course = create(:course)
        expect(course.name).to eq('New course')
        expect(course.description).to eq('some desc')
      end

    end
    it 'should have few lesson' do
      course    = create(:course)
      lesson_1  = create(:lesson)
      lesson_2  = create(:lesson, name: 'other')

      course << [lesson_1, lesson_2]
      except(course.lessons.size).to eq(2)
    end

    it 'shouldn`t create without name and description' do
      expect(build(:lesson, name: nil, description: nil)).to_not be_valid
    end
end

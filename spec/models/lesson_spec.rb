require 'rails_helper'

RSpec.describe Lesson, type: :model do
    describe 'create' do
      it 'valid lesson' do
        lesson = create(:lesson)
        expect(lesson.name).to eq('lesson name')
        expect(lesson.description).to eq('a b c d sdw' * 250)
      end
    end
    it 'shouldn`t create invalid lesson' do
      lesson = create(:lesson, name: '').should_not be_valid
      lesson = create(:lesson, description: '').should_not be_valid
    end


  # describe 'update' do
  #   it 'normal to admin' do
  #   end
  # end

  # it 'should be destroy' do
  #   user = create(:user)
  #   user.destroy
  #   expect(User.all.size).to eq(0)
  # end
end

require 'rails_helper'

RSpec.describe SortingCourses, type: :service do
  describe '#sort_by_dependency' do
    it "if user dependency present" do
      allow(user = create(:user)).to receive(:courses) { create_list(:course, 4) }
      create_list(:course, 4)
      sorting = SortingCourses.new(create(:sorting_course, user_dependency: true), user)
      expect(sorting.courses.size).to eq(4)
    end
    it "if time dependency present" do
      allow(user = create(:user)).to receive(:courses) { create_list(:course, 4) }
      create_list(:course, 4)
      sorting = SortingCourses.new(create(:sorting_course, user_dependency: true), user)
      expect(sorting.courses.size).to eq(4)
    end
  end  
end
  
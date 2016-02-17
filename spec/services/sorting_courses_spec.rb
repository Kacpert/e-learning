require 'rails_helper'

RSpec.describe SortingCoursesService, type: :service do
  describe '#sort_by_dependency' do
    it "if user dependency present" do
      allow(user = create(:user)).to receive(:courses) { create_list(:course, 4) }
      create_list(:course, 4)
      sorting = SortingCoursesService.new(create(:sorting_course, user_dependency: true), user)
      expect(sorting.courses.size).to eq(4)
    end
    it "if from date present" do
      create_list(:course, 4) 
      create_list(:course, 4, created_at: Date.new(2001, 5, 5))
      sorting = SortingCoursesService.new(create(:sorting_course, from_date: Date.yesterday, time_dependency: true), nil)
      expect(sorting.courses.size).to eq(4)
    end
  end  
end
  
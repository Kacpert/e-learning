class AddTimeFromToSortingCourses < ActiveRecord::Migration
  def change
    add_column :sorting_courses, :from_date, :date
  end
end

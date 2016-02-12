class CreateCoursesSortingCourses < ActiveRecord::Migration
  def change
    create_table :courses_sorting_courses, :id => false do |t|
      t.references :course, :sorting_course
    end

    add_index :courses_sorting_courses, [:course_id, :sorting_course_id],
      name: "courses_sorting_courses_index",
      unique: true
  end
end

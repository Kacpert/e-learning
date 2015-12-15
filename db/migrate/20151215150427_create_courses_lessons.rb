class CreateCoursesLessons < ActiveRecord::Migration
  def change
    create_table :courses_lessons do |t|
      t.references :course, index: true, foreign_key: true
      t.references :lesson, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

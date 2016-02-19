class AddCourseToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :course, index: true, foreign_key: true
  end
end

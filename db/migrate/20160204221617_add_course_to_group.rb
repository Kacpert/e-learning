class AddCourseToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :course, index: true, foreign_key: true
  end
end

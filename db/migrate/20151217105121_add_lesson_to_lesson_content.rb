class AddLessonToLessonContent < ActiveRecord::Migration
  def change
    add_reference :lesson_contents, :lesson, index: true, foreign_key: true
  end
end

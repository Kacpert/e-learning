class CreateLessonTests < ActiveRecord::Migration
  def change
    create_table :lesson_tests do |t|
      t.string :name
      t.text :question
      t.references :lesson, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

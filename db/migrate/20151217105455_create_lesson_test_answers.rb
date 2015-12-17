class CreateLessonTestAnswers < ActiveRecord::Migration
  def change
    create_table :lesson_test_answers do |t|
      t.text :description
      t.boolean :correct
      t.references :lesson_test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

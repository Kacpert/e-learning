class CreateLessonContents < ActiveRecord::Migration
  def change
    create_table :lesson_contents do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

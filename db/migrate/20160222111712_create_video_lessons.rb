class CreateVideoLessons < ActiveRecord::Migration
  def change
    create_table :video_lessons do |t|
      t.string :name
      t.text :description
      t.string :short_description
      t.string :video_url

      t.timestamps null: false
    end
  end
end

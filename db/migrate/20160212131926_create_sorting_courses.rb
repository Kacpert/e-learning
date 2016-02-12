class CreateSortingCourses < ActiveRecord::Migration
  def change
    create_table :sorting_courses do |t|
      t.string :name
      t.boolean :user_dependency, default: false
      t.boolean :time_dependency, default: false
      t.integer :order

      t.timestamps null: false
    end
  end
end

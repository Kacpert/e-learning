class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :short_description
      t.string :author

      t.timestamps null: false
    end
  end
end

class CreateSectionComponents < ActiveRecord::Migration
  def change
    create_table :section_components do |t|
      t.references :section, index: true, foreign_key: true
      t.integer :component_id, index: true, foreign_key: true
      t.string :component_type

      t.timestamps null: false
    end
  end
end

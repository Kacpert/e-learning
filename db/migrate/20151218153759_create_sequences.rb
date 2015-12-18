class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.integer :order
      t.integer :foreign_key
      t.string :sequence_type
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

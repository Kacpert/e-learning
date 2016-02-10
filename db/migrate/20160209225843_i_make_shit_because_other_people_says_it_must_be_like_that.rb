class IMakeShitBecauseOtherPeopleSaysItMustBeLikeThat < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.references :message, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :displayed, default: false


      t.timestamps null: false
    end
  end
end

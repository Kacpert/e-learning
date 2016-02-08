class DropMessagesUser < ActiveRecord::Migration
  def up
    drop_table :messages_users
  end

  def down
    create_table :messages_users do |t|
      t.references :message, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

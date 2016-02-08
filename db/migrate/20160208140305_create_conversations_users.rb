class CreateConversationsUsers < ActiveRecord::Migration
  def change
    create_table :conversations_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

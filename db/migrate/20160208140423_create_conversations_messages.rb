class CreateConversationsMessages < ActiveRecord::Migration
  def change
    create_table :conversations_messages do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

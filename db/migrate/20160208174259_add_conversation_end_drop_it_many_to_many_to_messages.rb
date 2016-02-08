class AddConversationEndDropItManyToManyToMessages < ActiveRecord::Migration
  def up
    add_reference :messages, :conversation, index: true, foreign_key: true
    drop_table :conversations_messages
  end
  def down
    remove_reference :messages, :conversation, index: true, foreign_key: true
    create_table :conversations_messages do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

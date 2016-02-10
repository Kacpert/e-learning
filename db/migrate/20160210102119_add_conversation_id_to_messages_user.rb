class AddConversationIdToMessagesUser < ActiveRecord::Migration
  def change
    add_column :messages_users, :conversation_id, :integer
  end
end

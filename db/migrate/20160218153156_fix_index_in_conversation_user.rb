class FixIndexInConversationUser < ActiveRecord::Migration
  def change
    add_index(:conversations_users, [:conversation_id, :user_id], unique: true)
  end
end

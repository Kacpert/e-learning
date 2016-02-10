class AddTitleToConversationAndMessages < ActiveRecord::Migration
  def change
    add_column :conversations, :title, :strig, default: ""
    add_column :messages, :title, :strig, default: ""
  end
end

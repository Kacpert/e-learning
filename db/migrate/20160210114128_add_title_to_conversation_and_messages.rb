class AddTitleToConversationAndMessages < ActiveRecord::Migration
  def change
    add_column :conversations, :title, :string, default: ""
    add_column :messages, :title, :string, default: ""
  end
end

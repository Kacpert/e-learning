class AddDisplayedToMessages < ActiveRecord::Migration
  def change
    add_column :messages_users, :displayed, :boolean, default: false
  end
end

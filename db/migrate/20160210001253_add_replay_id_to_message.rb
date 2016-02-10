class AddReplayIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :replay_id, :integer
  end
end

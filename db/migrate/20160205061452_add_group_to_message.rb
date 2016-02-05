class AddGroupToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :group, index: true, foreign_key: true
  end
end

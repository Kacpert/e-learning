class CreateMessagesUsers < ActiveRecord::Migration
  def change
    create_table :messages_users do |t|
      t.references :message, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

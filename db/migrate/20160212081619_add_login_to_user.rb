class AddLoginToUser < ActiveRecord::Migration
  def up
    add_column :users, :login, :string
    User.all.each do |user|
      user.update(login: "my_logis_#{user.id}")
    end
  end

  def down
    remove_column :users, :login, :string
  end
end

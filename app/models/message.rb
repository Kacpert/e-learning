class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :users, through: :messages_users
  has_many :messages_users
end

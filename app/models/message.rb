class Message < ActiveRecord::Base
  attr_accessor :user_logins
  default_scope { order(updated_at: :desc) }
  belongs_to :user
  belongs_to :conversation
  has_many :messages_users
  has_many :users, through: :messages_users
  #belongs_to :group
end

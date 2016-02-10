class Conversation < ActiveRecord::Base
  default_scope { order(updated_at: :desc) }
  has_many :messages
  has_many :conversations_users
  has_many :users, through: :conversations_users
end

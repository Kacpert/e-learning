class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversations
  #belongs_to :group
end

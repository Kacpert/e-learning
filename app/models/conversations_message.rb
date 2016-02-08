class ConversationsMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :message
end

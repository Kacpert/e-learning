class MessagesUser < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  before_save :add_conversation

  def add_conversation
    self.conversation_id = self.message.conversation.id
  end
end

json.array! @conversations do |con|
  json.id con.id
  json.new_messages @user.messages_users.where(displayed: false, conversation_id: con.id).size
  json.update_at con.updated_at
end
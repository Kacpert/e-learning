json.array! @conversations do |con|
  json.id con.id
  json.all_seen @user.messages_users.where(displayed: false, conversation_id: con.id).any?
  json.title con.title
  json.messages con.messages.size
  json.update_at con.updated_at.strftime("%Y-%m-%d %H:%M:%S")
end
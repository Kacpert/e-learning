json.array! @conversations do |con|
  json.id con.id
  json.all_seen !(@user.messages_users.where(displayed: false, conversation_id: con.id).any?)
  json.messages_unread_size @user.messages_users.where(displayed: false, conversation_id: con.id).size
  json.title con.title
  json.messages_size con.messages.size
  json.updated_at con.updated_at.strftime("%Y-%m-%d %H:%M:%S")
end
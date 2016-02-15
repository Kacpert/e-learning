json.id @conversation.id
json.title @conversation.title
json.updated_at @conversation.updated_at.strftime("%Y-%m-%d %H:%M:%S")
json.created_at @conversation.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.messages @messages do |message|
  json.id message.id
  json.login message.user.login
  json.title message.title
  json.text message.text
  json.displayed message.messages_users.find_by(user_id: current_user.id).displayed
  json.created_at message.created_at.strftime("%Y-%m-%d %H:%M:%S")
end
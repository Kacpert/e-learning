json.id @conversation.id
json.title @conversation.title
json.messages @messages do |message|
  json.id message.id
  json.user_id message.user_id
  json.login message.user.login
  json.users_logins message.users
  json.title message.title
  json.text message.text
  json.displayed message.messages_users.find_by(user_id: current_user.id).displayed
  json.created_at message.created_at.strftime("%Y-%m-%d %H:%M:%S")
end
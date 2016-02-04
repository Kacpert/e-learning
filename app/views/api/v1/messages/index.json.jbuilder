json.array! @messages do |message|
  json.id message.id
  json.name message.text
  json.user_name message.user.first_name
  json.created_at message.created_at
end

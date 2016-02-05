json.array! @messages do |message|
  json.id message.id
  json.text message.text
  json.created_at message.created_at
end

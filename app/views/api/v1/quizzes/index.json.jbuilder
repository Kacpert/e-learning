json.array! @quizzes do |quiz|
  json.id quiz.id
  json.name quiz.name
  json.description quiz.title
end

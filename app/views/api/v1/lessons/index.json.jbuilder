json.lessons @lessons do |lesson|
  json.name lesson.name
  json.description lesson.description
  json.image_url asset_url(lesson.image.url)
end

json.array! @lessons do |lesson|
  json.id lesson.id
  json.name lesson.name
  json.description lesson.description
  json.video_url lesson.video_url
  json.subtitles_url lesson.subtitles_url
  json.image_url asset_url(lesson.image.url)
end

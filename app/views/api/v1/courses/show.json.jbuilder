json.course do
  json.name @course.name
  json.description @course.description
  json.long_description @course.long_description
  json.author @course.author
  json.image_url asset_url(@course.image.url)
end
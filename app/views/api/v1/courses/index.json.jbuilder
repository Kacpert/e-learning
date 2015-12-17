json.courses @courses do |course|
  json.name course.name
  json.description course.description
  json.image_url asset_url(course.image.url)
end

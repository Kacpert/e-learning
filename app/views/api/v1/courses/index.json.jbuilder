json.array! @categories do |category|
  json.category_title category[:category_title]
  json.courses category[:courses] do |course|
    json.id course.id
    json.name course.name
    json.description course.description
    json.short_description course.short_description
    json.author course.author
    json.created_at course.created_at
    json.image image_url(course)
  end
end
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
    json.progress [0.0, 0.3, 0.4, 0.66, 0.89, 0.2, 0.5, 0.7, 0.33, 0.45].sample
    json.joined [true, false].sample
  end
end
json.array! @categories do |category|
  json.category_title category[:category_title]
  json.courses category[:courses]
end
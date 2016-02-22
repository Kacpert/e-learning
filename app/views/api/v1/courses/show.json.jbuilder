json.id @course.id
json.name @course.name
json.description @course.description
json.short_description @course.short_description
json.author @course.author
json.image_url asset_url(@course.image.url)
json.order @course.order
json.temporal @course.temporal
json.sections @course.sections, partial: 'api/v1/sections/section', as: :section

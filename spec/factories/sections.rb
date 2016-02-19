FactoryGirl.define do
  factory :section do
    course
    name "MyString"
    description "MyString"
    order 1
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end

end

FactoryGirl.define do
  factory :course do
    name          'New course'
    description   'some desc'
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

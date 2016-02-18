FactoryGirl.define do
  factory :course do
    name                  'New course'
    description           'some desc'
    short_description      'short_description'
    author                'autor'
    order                  1
    temporal               true
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

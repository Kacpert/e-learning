FactoryGirl.define do
  factory :course do
    user
    name                  'New course'
    description           'some desc'
    long_description      'long description'
    author                'autor'
    order                  1
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

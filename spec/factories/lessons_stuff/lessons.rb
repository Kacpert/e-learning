FactoryGirl.define do
  factory :lesson do
    name                  'lesson name'
    description           { 'a b c d sdw' * 250 }
    lesson_type           'test'
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

FactoryGirl.define do
  factory :lesson do
    name                  'lesson name'
    description           { 'a b c d sdw' * 50 }
    content               { 'a b c d sdw' * 250  }
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

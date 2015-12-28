FactoryGirl.define do
  factory :content do
    name                 { 'Content name'     }
    description          { 'Content des'      }
    image_file_name      { 'lesson_image.jpg' }
    image_content_type   { 'image/png'        }
    image_file_size      { 1024               }
    course
  end
end
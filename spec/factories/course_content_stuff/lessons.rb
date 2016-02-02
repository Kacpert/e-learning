FactoryGirl.define do
  factory :lesson do
    name                  'New course'
    description           'some desc'
    video_url             'www.google.com'
    subtitles_url         'www.google.com'
    image_file_name       { 'lesson_image.jpg' }
    image_content_type    { 'image/png' }
    image_file_size       { 1024 }
  end
end

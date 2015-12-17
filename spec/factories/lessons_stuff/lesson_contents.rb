FactoryGirl.define do
  factory :lesson_content do
    name                  'content name'
    description           { 'a b c d sdw' * 50 }
    lesson
  end
end

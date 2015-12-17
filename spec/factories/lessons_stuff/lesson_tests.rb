FactoryGirl.define do
  factory :lesson_test do
    name                  'test name'
    question              { 'a b c d sdw' * 10 }
    lesson
  end
end

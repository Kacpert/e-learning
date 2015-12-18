FactoryGirl.define do
  factory :sequence do
    order         1
    foreign_key   1
    sequence_type 'lesson'
    course
  end
end

# FactoryGirl.define do
#   factory :lesson do
#     name                  'New lesson'
#     description           'some desc'
#     after(:create) { |lesson| lesson.contents = [create(:content)] }
#   end
# end

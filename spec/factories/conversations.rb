FactoryGirl.define do
  factory :conversation do
    after(:create) do |conv|
      conv.users << FactoryGirl.create_list(:user, 4)
    end
  end
end

FactoryGirl.define do
  factory :message do
    user
    text "MyText"
    after(:create) do |mess|
      mess.users << FactoryGirl.create_list(:user, 4)
    end
  end

end

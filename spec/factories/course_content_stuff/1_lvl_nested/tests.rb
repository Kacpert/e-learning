FactoryGirl.define do
  factory :test do
    after(:create) { |test| test.contents = [create(:content)] }
  end
end
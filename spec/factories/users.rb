FactoryGirl.define do
  factory :user do
    email                   { Faker::Internet.email }
    first_name              'John'
    last_name               'Doel'
    admin                   false
    password                '12345678'
    password_confirmation   '12345678'
  end

  factory :admin, class: User do
    email                   'admin@admin.com'
    first_name              'Admin'
    last_name               'Doel'
    admin                   true
    password                'password'
    password_confirmation   'password'
  end
end

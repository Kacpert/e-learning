FactoryGirl.define do
  factory :user do
    email                   'john@gmail.com'
    first_name              'John'
    last_name               'Doel'
    admin                   false
    password                'password'
    password_confirmation   'password'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email                   'admin@admin.com'
    first_name              'Admin'
    last_name               'Doel'
    admin                   true
    password                'password'
    password_confirmation   'password'
  end
end
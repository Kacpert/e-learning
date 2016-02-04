# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# User.create(first_name: 'Admin', last_name: 'Admin', admin: true, email: 'admin@admin.com', password: 'password')


# 20.times do 

#   Course.create(name: Faker::Company.catch_phrase,
#     description: Faker::Lorem.sentence,
#     order: rand(50),
#     author: Faker::Name.name,
#     long_description: Faker::Lorem.paragraphs,
#     )
# end

user = User.first
3.times do
  group = Group.create(name: Faker::Company.catch_phrase)
  user.groups << group
end

5.times do
  Message.create(user: user, text: Faker::Lorem.paragraphs)
end
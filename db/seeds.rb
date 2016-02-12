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

# user = User.first
# 3.times do
#   group = Group.create(name: Faker::Company.catch_phrase)
#   user.groups << group
# end

# 5.times do
#   Message.create(user: user, text: Faker::Lorem.paragraphs)
# end

SortingCourse.create(name: 'Your courses', user_dependency: true)
SortingCourse.create(name: 'Most REcent', time_dependency: true)

#messages
u_1 = User.last(3)
u_2 = User.last(4)
u_3 = User.last(9)
c_1 = Convesation.create(title: Faker::Name.name)
c_2 = Convesation.create(title: Faker::Name.name)
c_3 = Convesation.create(title: Faker::Name.name)
c_1 << u_1
c_2 << u_2
c_3 << u_3
create_messages(u_1, c_1)
create_messages(u_2, c_2)
create_messages(u_3, c_3)
def create_messages(users, conversation)
  10.times do
    users.each do |user|
      conversation.messages.create(user: user, title: Faker::Name.name, text: Faker::Lorem.sentence )
    end
  end
end
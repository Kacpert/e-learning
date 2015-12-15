class Course < ActiveRecord::Base
  has_many :lessons, through: :courses_lessons
  has_many :courses_lessons
end

class CoursesLesson < ActiveRecord::Base
  belongs_to :course
  belongs_to :lesson
end

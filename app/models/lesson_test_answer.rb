class LessonTestAnswer < ActiveRecord::Base
  belongs_to :lesson_test

  validates :description, presence: true
  validates :correct, presence: true
end

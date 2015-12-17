class LessonTest < ActiveRecord::Base
  belongs_to :lesson
  has_many :lesson_test_answers

  validates :name, presence: true
  validates :question, presence: true
end

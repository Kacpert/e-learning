class LessonContent < ActiveRecord::Base
  belongs_to :lesson

  validates :name, presence: true
  validates :description, presence: true
end

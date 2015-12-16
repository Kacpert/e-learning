class Lesson < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :description, presence: true
  validates :lesson_type, presence: true, inclusion: { in: %w(test content) }

  has_many :courses, through: :courses_lessons
  has_many :courses_lessons
end

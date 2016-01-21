class Course < ActiveRecord::Base
  belongs_to :user
  has_many :categories_courses
  has_many :categories, through: :categories_courses

  validates :name, :description, presence: true
end

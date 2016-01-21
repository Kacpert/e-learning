class Category < ActiveRecord::Base
  has_many :categories_courses
  has_many :categories, through: :categories_courses
  
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
end

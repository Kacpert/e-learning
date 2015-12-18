class Course < ActiveRecord::Base
  has_many :sequences

  validates :name, presence: true
  validates :description, presence: true
end

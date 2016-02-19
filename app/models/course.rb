class Course < ActiveRecord::Base
  has_and_belongs_to_many :sorting_courses
  belongs_to :user
  has_many :sections
  has_many :groups
  has_many :categories_courses
  has_many :categories, through: :categories_courses
  has_many :courses_users
  has_many :users, through: :courses_users

  validates :name, presence: true
  validates :short_description, length: { maximum: 240 }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

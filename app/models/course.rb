class Course < ActiveRecord::Base
  belongs_to :user
  has_many :groups
  has_many :categories_courses
  has_many :categories, through: :categories_courses

  validates :name, :description, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

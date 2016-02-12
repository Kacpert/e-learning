class SortingCourse < ActiveRecord::Base
  default_scope { order(:order) }
  has_and_belongs_to_many :courses
end

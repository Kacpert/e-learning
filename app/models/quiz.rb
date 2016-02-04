class Quiz < ActiveRecord::Base
  validates :name, :title, presence: true
end

class Question < ActiveRecord::Base
  belongs_to :test
  has_many :question_answers

  validates :question, presence: true
end

class Sequence < ActiveRecord::Base
  belongs_to :course

  validates :order, presence: true
  validates :sequence_type, presence: true, inclusion: { in: %w(test lesson) }
  validates :foreign_key, presence: true

  validate :uniqueness_of_order_in_course

  protected

  def uniqueness_of_order_in_course
    if Sequence.find_by(order: self.order, course: self.course.id).present?
      errors.add(:base, 'Sequence in Course should have unique order')      
    end
  end
end

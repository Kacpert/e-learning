class SectionComponent < ActiveRecord::Base
  belongs_to :component, polymorphic: true
  belongs_to :section
end

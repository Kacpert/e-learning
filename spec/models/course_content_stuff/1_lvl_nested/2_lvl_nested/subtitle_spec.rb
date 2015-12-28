require 'rails_helper'
RSpec.describe Lesson, type: :model do
  # If you create model remove that comment and lines between it 
  class Content
    attr_accessor :name, :description, :image_file_name, :image_content_type, :image_file_size
    def course=(arg)
    end
    def save!
    end
  end
  class Lesson
    def contents=(arg)
    end
    def save!
    end
  end
  class Subtitle
    def subtitle=(arg)
    end
    def save!
    end
  end
# end comment.

  let(:subtitle) { create(:subtitle) }
  subject { subtitle }

  context 'when valid #create' do
    its(:lesson_id) { should eq(Lesson.first.id) }
  end

  context 'when valid #update' do
    before { subtitle.update(lesson_id: create(:lesson, name: 'new name', description: 'new desc').id) } 
    its(:lesson_id) { should eq(Lesson.second.id) }
  end

  include_examples 'removeable', Subtitle

end
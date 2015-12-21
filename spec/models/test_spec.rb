require 'rails_helper'

# If you create model remove that comment and lines between it 
  class Content
    attr_accessor :name, :description, :image_file_name, :image_content_type, :image_file_size
    def course=(arg)
    end
    def save!
    end
  end
  class Test
    def contents=(arg)
    end
    def save!
    end
  end
# end comment.

RSpec.describe Test, type: :model do
  describe 'associations' do
    it 'between content many to many' do
      test = create(:test)
      test.contents << create(:content, name: 'name')
      expect(test.contents.first.name).to eq('Content name') 
      expect(test.contents.second.name).to eq('name') 
    end
  end
end
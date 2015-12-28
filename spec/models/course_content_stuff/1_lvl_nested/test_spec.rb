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
  let(:test) { create(:test) }
  subject { test }
  include_examples 'many to many with content'

  include_examples 'removeable', Test
end
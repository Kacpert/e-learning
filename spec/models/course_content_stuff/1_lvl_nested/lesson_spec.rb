# require 'rails_helper'
# RSpec.describe Lesson, type: :model do
#   # If you create model remove that comment and lines between it 
#   class Content
#     attr_accessor :name, :description, :image_file_name, :image_content_type, :image_file_size
#     def course=(arg)
#     end
#     def save!
#     end
#   end
#   class Lesson
#     def contents=(arg)
#     end
#     def save!
#     end
#   end
# # end comment.

#   let(:lesson) { create(:lesson) }
#   subject { lesson }

#   context 'when valid #create' do
#     its(:name) { should eq('New lesson') }
#     its(:description) { should eq('some desc')}
#     its('contents.size') { should eq(1) }
#   end

#   context 'when valid #update' do
#     before { lesson.update(name: 'new name', description: 'new desc') } 
#     its(:name) { should eq('new name') }
#     its(:description) { should eq('new desc')}
#   end

#   include_examples 'many to many with content'
#   include_examples 'removeable', Lesson

# end
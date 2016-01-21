# require 'rails_helper'

# # If you create model remove that comment and lines between it 
#   class Content
#     attr_accessor :name, :description, :image_file_name, :image_content_type, :image_file_size
#     def course=(arg)
#     end
#     def save!
#     end
#   end
#   class Test
#     def contents=(arg)
#     end
#     def save!
#     end
#   end
#   class Question
#     attr_accessor :text, :test_id
#     def test=(arg)
#     end
#     def save!
#     end
#   end
# # end comment.

# RSpec.describe Question, type: :model do
#   let(:question) { create(:question) }
#   subject { question }
  
#   context 'when valid #create' do
#     its(:text) { should eq('question text') }
#     its('test_id') { should eq(Test.first.id) }
#   end

#   context 'when valid #update' do
#     before { question.update(test_id: Test.create().id) } 
#     its(:test_id) { should eq(Test.second.id) }
#   end

#   include_examples 'removeable', Question
# end
require 'rails_helper'

# If you create model remove that comment and lines between it 
  class Content
    attr_accessor :name, :description, :image_file_name, :image_content_type, :image_file_size
    def course=(arg)
    end
    def save!
    end
  end
# end comment.

RSpec.describe Content, type: :model do
  before(:example) do
    create(:content)
    @content = Content.first
  end

  describe 'validation' do
    it 'should require name' do 
      expect(build(:content, name:'')).to_not be_valid 
    end
    it 'should require description' do
      expect(build(:content, description:'')).to_not be_valid 
    end
  end

  describe 'when #create' do
    it 'should create' do
      expect(@content.name).to be('Content name') 
      expect(@content.description).to be('Content des') 
    end
  end

  describe 'when #update' do
    it 'should update name and description' do
      @content.name =        'new name'
      @content.description = 'new desc'
      @content.save
      expect(@content.name).to eq('new name')
      expect(@content.description).to
    end
  end

  describe 'when #destroy' do 
    it 'should remove content' do
      @content.destroy
      expect(Content.all.size).to eq(0)
    end
  end

  describe 'associations' do
    it 'should belongs to course' do
      expect(@content.course.name).to eq('New course')
    end
  end
end


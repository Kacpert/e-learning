require 'rails_helper'


RSpec.describe Lesson, type: :model do
  context 'parametrs' do
    it { should respond_to(:name) }
    it { should respond_to(:image) }
    it { should respond_to(:description) }
    it { should respond_to(:video_url) }
    it { should respond_to(:subtitles_url) }

    #it { should respond_to(:chat_id) }
  end

  context 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description)}
  end
end

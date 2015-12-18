require 'rails_helper'

RSpec.describe Sequence, type: :model do
  before do
    @lesson     = create(:lesson)
    @test       = create(:test)
    @course     = create(:course)
    @sequence   = create(:sequence, course: @course, type: 'lesson', foreign_key: @lesson.id)
  end

  describe "when #new" do
    it "should have unique order number in course group" do
      expect(build(:sequence, course: @course)).to_not be_valid
    end

    it "can have the same order number as sequence in other course group" do
      expect(build(:sequence, course: create(:course))).to be_valid
    end

    it 'shouldn`t create without order number' do
      expect(build(:sequence, order: '')).to_not be_valid
    end

    it 'shouldn`t create without type' do
      expect(build(:sequence, type: '')).to_not be_valid
    end

    it 'shouldn`t create without foreign_key' do
      expect(build(:sequence, foreign_key: '')).to_not be_valid
    end

    it 'should have valid type of "test"' do
      expect(build(:sequence, type: 'test')).to be_valid
    end

    it 'should have valid type of "lesson"' do
      expect(build(:sequence, type: 'lesson')).to be_valid
    end

    it 'should not have valid type of "contents"' do
      expect(build(:sequence, type: 'contents')).to_not be_valid
    end

    it 'should not have valid type of "cos"' do
      expect(build(:sequence, type: 'cos')).to_not be_valid
    end
  end

  describe "when #update" do
    it "should be updated with new name" do
      @sequence.update(order: 2)
      expect(@sequence.order).to eq(2)
    end
  end

  describe "when #destroy" do
    it "should be deletable" do
      @sequence.destroy
      expect(Sequence.all.size).to eq(0)
    end
  end
end


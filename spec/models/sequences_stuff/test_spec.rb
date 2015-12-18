require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    Question.all.destroy_all
    @test = create(:test, questions: create_list(:question, 12))
    create(:sequence, type: 'test', foreign_key: @test.id)
  end

  describe "when #create" do
    context 'valid' do
      it "should have valid name" do
        expect(@test.name).to eq('test name')
      end

      it 'should have 12 questions' do
        expect(@test.questions.size).to eq(12)
      end

      it "should have valid sequence" do
        expect(@test.sequences.first.order).to eq(1)
      end
    end

    context 'invalid' do
      it 'should not be valid without name' do
        expect(build(:test, name: '')).to_not be_valid
      end
    end
  end

  describe "when #update" do
    it "should have valid name" do
      @test.update(name: 'new name')
      expect(@test.name).to eq('new name')
    end
  end

  describe "when #destroy" do
    it "should be deleteable" do
      @test.destroy
      expect(Test.all.size).to eq(0)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @admin = create(:admin)
    @user = create(:user)
  end

  describe "when #create" do
    context 'admin' do
      it "should have valid email" do
        expect(@admin.email).to eq('admin@admin.com')
      end

      it "should have valid first_name" do
        expect(@admin.first_name).to eq('Admin')
      end

      it "should have valid last_name" do
        expect(@admin.last_name).to eq('Doel')
      end

      it "should have valid admin" do
        expect(@admin.admin).to eq(true)
      end
    end

    context 'user' do
      it "should have valid email" do
        expect(@user.email).to eq('john@gmail.com')
      end

      it "should have valid first_name" do
        expect(@user.first_name).to eq('John')
      end

      it "should have valid last_name" do
        expect(@user.last_name).to eq('Doel')
      end

      it "should have valid admin" do
        expect(@user.admin).to eq(false)
      end
    end
  end

  describe "when #update" do
    context 'user' do
      it "should be admin" do
        @user.update(admin: true)
        expect(@user.admin).to eq(true)
      end

      it "should have valid last_name" do
        @user.update(last_name: 'Toe')
        expect(@user.last_name).to eq('Toe')
      end

      it "should have valid first_name" do
        @user.update(first_name: 'Michael')
        expect(@user.first_name).to eq('Michael')
      end
    end
  end

  describe "when #destroy" do
    it "should be deletable" do
      @user.destroy
      @admin.destroy
      expect(User.all.size).to eq(0)
    end
  end
end

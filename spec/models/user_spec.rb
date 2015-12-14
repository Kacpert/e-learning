require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'create' do
    it 'valid admin' do
      admin = create(:admin)
      expect(admin.email).to eq('admin@admin.com')
      expect(admin.first_name).to eq('Admin')
      expect(admin.last_name).to eq('Doel')
      expect(admin.admin).to eq(true)
    end

    it 'valid normal' do
      user = create(:user)
      expect(user.email).to eq('john@gmail.com')
      expect(user.first_name).to eq('John')
      expect(user.last_name).to eq('Doel')
      expect(user.admin).to eq(false)
    end
  end


  describe 'update' do
    it 'normal to admin' do
      user = create(:user)
      user.update(admin: true)
      expect(user.admin).to eq(true)
    end

    it 'last_name' do
      user = create(:user)
      user.update(last_name: 'Toe')
      expect(user.last_name).to eq('Toe')
    end

    it 'first_name' do
      user = create(:user)
      user.update(first_name: 'Michael')
      expect(user.first_name).to eq('Michael')
    end
  end

  it 'should be destroy' do
    user = create(:user)
    user.destroy
    expect(User.all.size).to eq(0)
  end
end

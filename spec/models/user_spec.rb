require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should create valid admin user' do
    admin = create(:admin)

    expect(admin.email).to eq('admin@admin.com')
    expect(admin.first_name).to eq('Admin')
    expect(admin.last_name).to eq('Doel')
    expect(admin.admin).to eq(true)
  end

  it 'should create valid normal user' do
    user = create(:user)

    expect(user.email).to eq('john@gmail.com')
    expect(user.first_name).to eq('John')
    expect(user.last_name).to eq('Doel')
    expect(user.admin).to eq(false)
  end

  it 'should update user to admin' do
    user = create(:user)
    user.update(admin: true)
    expect(admin.admin).to eq(true)
  end

  it 'should destroy user' do
    user = create(:user)
    user.update(admin: true)
    expect(admin.admin).to eq(true)
  end
end

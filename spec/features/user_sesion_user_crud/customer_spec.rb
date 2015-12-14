require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'should be able to edit they own account' do
    user = create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link 'Edit account' 
    fill_in 'First name', with: 'Tomas'
    fill_in 'Last name', with: 'Richy'
    fill_in 'Current password', with: user.password
    first(:button, 'Update Account').click
    expect(page.has_button?('Log out')).to eq(true)
  end
end

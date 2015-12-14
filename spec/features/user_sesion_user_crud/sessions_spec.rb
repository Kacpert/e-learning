require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  it 'should login user' do
    user = create(:user)
    sign_in user
    visit '/'
    click_button 'Sign in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    expect(page.has_button?('Log out')).to eq(true)
  end
end
require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  it 'should login user' do
    user = create(:user)
    visit '/'
    click_button 'Sign in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    first(:button, 'Sign in').click
    expect(page.has_button?('Sign out')).to eq(true)
  end
end

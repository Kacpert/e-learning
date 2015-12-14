require 'rails_helper'

RSpec.feature "PopupLogins", type: :feature do
  #it 'should login user by popup', js: true do
  it 'should login user by popup' do
    user = create(:user)
    visit '/'
    click_button 'Sign in'
    within("#pop-up") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Sign in'
    end
    expect(page.has_button?('Log out')).to eq(true)
  end
end

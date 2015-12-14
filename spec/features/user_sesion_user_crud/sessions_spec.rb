require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  it 'should login user' do
    user = create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    find('input[type="submit"][name="commit"][value="Sign in"]').click
    expect(page.has_link?('Sign out')).to eq(true)
  end
end

# require 'rails_helper'

# RSpec.feature "Sorting courses", type: :feature do
#   it 'should sort by my courses' do
#     user = create(:user)
#     courses = create_lsit(:course, 4)
#     create_lsit(:course, 5)
#     user << courses
#     get '/api/v1/courses'
#     click_link 'Sign in'
#     fill_in 'Email', :with => user.email
#     fill_in 'Password', :with => user.password
#     find('input[type="submit"][name="commit"][value="Sign in"]').click
#     expect(page.has_link?('Sign out')).to eq(true)
#   end
# end

require 'rails_helper.rb'

feature 'Creating Users' do
  scenario 'can create user' do
    visit '/'
    click_link 'New User'
    visit 'new_user_registration'

  end
end

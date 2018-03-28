require 'rails_helper.rb'

feature 'Creating Doctor Sessions' do
  scenario 'can create doctor session' do
    visit '/'
    click_link 'Doctor Login'
  end
end

require 'rails_helper'

RSpec.feature 'Splash index page', type: :feature do
  before do
    visit root_path
  end

  scenario 'Displays splash details' do
    expect(page).to have_content('XpenseList')
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end

  scenario 'Clicking on login redirects to login page' do
    click_on 'Log in'
    sleep(1)
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'Clicking on Sign up redirects to registration page' do
    click_on 'Sign up'
    sleep(1)
    expect(current_path).to eq(new_user_registration_path)
  end
end

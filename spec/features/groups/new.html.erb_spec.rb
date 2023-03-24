require 'rails_helper'

RSpec.feature 'Group/Category new page', type: :feature do
  let!(:user) { create(:user) }
  let!(:category) { create(:group, user:, name: 'Apple Test', icon: 'icon') }
  before do
    sign_in user
    visit new_group_path
  end

  scenario 'Displays new category page' do
    expect(page).to have_current_path(new_group_path)
    expect(page).to have_content('ADD CATEGORY')
    expect(page).to have_selector("input[type=submit][value='Save']")
    find('input[type="submit"][value="Save"]').click
    expect(page).to have_content('ADD CATEGORY')
  end
end

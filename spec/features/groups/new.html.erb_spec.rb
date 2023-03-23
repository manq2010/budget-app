require 'rails_helper'

RSpec.feature 'Group/Category new page', type: :feature do
  let!(:user) { create(:user) }
  let!(:category) { create(:group, user: user, name: 'Apple Test', icon: "icon") }
  before do
    # visit new_user_session_path
    # fill_in 'Email', with: user.email
    # fill_in 'Password', with: user.password
    # click_on "Log in"
    sign_in user
    visit new_group_path
  end

  scenario 'Displays new category page' do
    # click_on 'Add Category'
    # sleep(1)
    # category = Group.new(name: 'Apple Test', icon: "icon", user_id: user.id)
    # within('.add-category form') do
    #   fill_in 'Category name', with: category.name
    #   fill_in 'Icon url', with: category.icon
    #   click_on 'Save'
    # end
    # sleep(1)
    expect(page).to have_current_path(new_group_path)
    expect(page).to have_content('ADD CATEGORY')
    expect(page).to have_selector("input[type=submit][value='Save']")
    find('input[type="submit"][value="Save"]').click
    # expect(current_path).to eq(group_path(category))
    expect(page).to have_content('ADD CATEGORY')
    # expect(page).to have_content('Apple Test')
    # expect(page).to have_css('.group-item', count: 1)
  end
end
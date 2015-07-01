# spec/features/user_album7_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  let(:other_user) { create(:user) }

  context 'As an authenticated user' do
    let(:user) { create_current_user }
    let(:other_user) { create(:user) }
    let(:album_name) { 'furkitties' }

    scenario 'I can add a new image collection to my account' do
      visit user_path(user)
      save_and_open_page
      click_link('Create Album')
      fill_in 'album_name', with: album_name
      click_button('submit')
      expect(page).to have_content('success')
      expect(page).to have_content(album_name)
    end

    scenario 'A link to this collection will appear on my user profile page' do
      visit user_path(user)
      click_link('album_name')
      expect(page).to have_content('album_name')
    end

    scenario 'I can edit information for my image collection' do
      visit album_path(user)
      click_link('edit album')
      fill_in 'album_Name', with: 'my furbabies'
      click_button('submit')
      expect(page).to have_content('success')
      expect(page).to have_content('my furbabies')
    end

    scenario 'I can not edit information for the image collection for others' do
      visit user_path(other_user)
      click_link('album_name')
      expect(page).to_not have_content('Edit Albums')
    end
  end
end

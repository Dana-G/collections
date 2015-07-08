# spec/features/user_album7_spec.rb
require 'feature_helper'
RSpec.feature 'create albums' do
  let(:other_user) { create(:user) }

  context 'As an authenticated user' do
    let!(:user) { create_current_user }
    let(:other_user) { create(:user) }
    let!(:album) { create(:album, user: user) }
    let(:name) { 'namethis' }
    let!(:other_album) { create(:album, user: other_user) }

    scenario 'I can add a new image collection to my account' do
      visit user_path(user)
      click_link('new album')
      fill_in 'album_name', with: name
      click_button('submit')
      expect(page).to have_content(name)
    end

    scenario 'A link to this collection will appear on my user profile page' do
      visit user_path(user)
      expect(page).to have_link(album.name)
    end

    scenario 'I can edit information for my image collection' do
      visit user_path(user)
      click_link('new album')
      fill_in 'Name', with: 'my furbabies'
      click_button('submit')
      expect(page).to have_content('success')
      expect(page).to have_content('my furbabies')
    end

    scenario 'I can not edit information for the image collection for others' do
      visit user_path(other_user)
      click_link(other_album.name)
      expect(page).to_not have_content('new')
    end
  end
end

# spec/features/user_album7_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  let(:other_user) { create(:user) }

  context 'As an authenticated user' do
    let(:user) { create_current_user }

    scenario 'I can add a new image collection to my account' do
      visit user_path(user)
      click_link('add album')
      expect(page).to have_content('Albums')
    end

    scenario 'A link to this collection will appear on my user profile page' do
      visit users_path
      expect(page).to have_link('albums')
    end

    scenario 'I can edit information for my image collection' do
      visit user_path(user)
      click_link('edit albums')
      expect(page).to have_content('Edit Albums')
    end

    scenario 'I can not edit information for the image collection for others' do
      visit user_path(other_user)
      click_link('edit albums')
      expect(page).to have_content('Edit Albums')
    end
  end
end

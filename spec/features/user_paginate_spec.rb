# spec/features/user_paginate_spec.rb
require 'feature_helper'
RSpec.feature 'viewing index of users' do
  let!(:other_user) { create(:user) }
  let!(:other_album) { create(:album, user: other_user) }
  let!(:album) { create(:album, user: user) }
  let!(:user) { create(:user) }

  context 'As a non-credentialed user' do
    scenario 'I can view a list of users' do
      visit users_path
      expect(page).to have_content('All Users')
    end

    scenario 'list should be paginated' do
      create_list(:user, 12)
      visit users_path
      click_link('2')
      expect(page).to have_content('All Users')
    end

    scenario 'I can click the user\'s name to view a user profile page' do
      visit users_path
      click_link(user.email)
      expect(page).to have_content('User Profile')
    end
  end
end

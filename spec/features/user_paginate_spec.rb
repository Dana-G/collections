# spec/features/user_paginate_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  context 'As a non-credentialed user' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      11.times do
        create(:user)
      end
    end

    scenario 'I can view a list of users' do
      visit users_path
      expect(page).to have_content('All Users')
    end

    scenario 'list should be paginated' do
      visit users_path
      expect(page).to have_link(@users)
    end

    scenario 'I can click the user\'s name to view a user profile page' do
      visit users_path
      click_link('1')
      expect(page).to have_content('User Profile Page')
    end
  end
end

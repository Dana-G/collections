# spec/features/user_paginate_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  context 'As a non-credentialed user' do
    let(:user) { FactoryGirl.create(:user) }

    scenario 'I can view a list of users' do
      create(:user)
      visit users_path
      expect(page).to have_content('All Users')
    end

    scenario 'list should be paginated' do
      11.times do
        create(:user)
      end
      visit users_path
      click_link('2')
      expect(page).to have_content('All Users')
    end

    scenario 'I can click the user\'s name to view a user profile page' do
      create(:user)
      visit users_path
      click_link('example')
      expect(page).to have_content('User Profile')
    end
  end
end

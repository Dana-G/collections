# spec/features/edit_user_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  let(:other_user) { create(:user) }
  context 'As a guest' do
    scenario 'I can not edit user information' do
      visit root_url
      expect(page).to_not have_link('edit profile')
      visit edit_user_path(other_user)
      expect(page).to have_content('unauthorized')
    end
  end

  context 'as an authenticated user' do
    let!(:user) { create_current_user }
    let(:new_email) { 'goop@great.com' }

    scenario 'I can edit my user information' do
      visit root_url
      click_link('edit')
      fill_in 'user_email', with: new_email
      click_button('submit')
      expect(page).to have_content('success')
      expect(page).to have_content(new_email)
    end

    scenario 'I can see errors with bad information' do
      visit root_url
      click_link('edit')
      fill_in 'user_email', with: ''
      click_button('submit')
      expect(page).to have_content('invalid')
    end

    scenario 'I can not edit other user\'s information' do
      visit edit_user_path(other_user)
      expect(page).to have_content('unauthorized')
    end
  end
end

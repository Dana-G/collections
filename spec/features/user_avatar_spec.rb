# spec/features/user_avatar_spec.rb
require 'feature_helper'
RSpec.feature 'add avatar' do
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }

  context 'As a non-authenticated user creating an account' do
    scenario 'I can upload a picture for use as an avatar' do
      visit signup_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      page.find('#user_avatar').click
      page.attach_file('user_avatar', './spec/factories/callie.jpg')
      click_button('Sign Up')
      expect(page).to have_content('Thanks for signing up')
    end
  end

  context 'As an authenticated user updating my account' do
    let(:user) { create_current_user }
    scenario 'I can upload a picture for use as an avatar' do
      visit user_path(user)
      click_link('edit')
      page.find('#user_avatar').click
      page.attach_file('user_avatar', './spec/factories/callie.jpg')
      click_button('submit')
      expect(page).to have_content('success')
    end
  end
end

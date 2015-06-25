# spec/features/user_avatar_spec.rb
require 'feature_helper'
RSpec.feature 'User edit' do
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }
  let!(:image_file) { file_upload('/callie.jpg', 'image/jpg') }

  context 'As a non-authenticated user creating an account' do
    scenario 'I can upload a picture for use as an avatar' do
      visit signup_path
        click_link('Sign Up')
        within('#new-user') do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
          click_button 'Choose File'
          page.attach_file('#user_avatar, Rails.root + 'spec/factories/callie.jpg')
        end
        click_button('submit')
        expect(page).to have_content('Thanks for signing up')
    end
  end


# context 'As an authenticated user updating my account' do
#     scenario 'I can upload a picture for use as an avatar' do


#     end
#   end
end

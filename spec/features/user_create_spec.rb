require 'feature_helper'
RSpec.feature 'User create' do
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }

  context 'As an non-member user' do
    context 'with acceptable information' do
      scenario 'I can register for a new account' do
        visit root_path
        click_link('Sign Up')
        expect(page).to have_content('Sign Up')
        within('#new-user') do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
        end
        click_button('Sign Up')
        expect(page).to have_content('Thanks for signing up')
      end
    end
  end
end

require 'feature_helper'
RSpec.feature 'User authenticate' do

  context 'As a non-credentialed member' do
    let(:user) do
      create(:user,
             email: email,
             password: password,
             password_confirmation: password)
    end

    context 'providing valid information' do
      scenario 'I can authenticate as a user of collections' do
        visit root_url
        expect(page).to have_content('Login')
        expect(page).not_to have_content('Logout')
        click_link ('Login')
        within('#user-header') do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
        end
        click_button('Login')
        expect(page).to have_content('You are logged in')
        expect(page).to have_content('Logout')
        expect(page).not_to have_content('Login')
        expect(page).not_to have_content('Sign Up')
      end
    end
  end
end
# spec/features/auth_spec.rb
require 'feature_helper'
RSpec.feature 'User authenticate' do
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }

  context 'As a non-credentialed member' do
    let!(:user) do
      create(:user,
             email: email,
             password: password,
             password_confirmation: password
            )
    end

    context 'providing valid login information' do
      scenario 'I can authenticate as a user of collections' do
        visit login_path
        expect(page).not_to have_content('Logout')
        click_link('Login')
        within('#login-user') do
          fill_in 'Email', with: email
          fill_in 'password', with: password
          fill_in 'password_confirmation', with: password_confirmation
        end
        click_button('Login')
        expect(page).to have_content('Logged in')
        expect(page).to have_content('Logout')
        expect(page).to_not have_content('Login')
        expect(page).to_not have_content('Sign Up')
      end
    end
  end

  context 'providing invalid login information' do
    let(:email) { 'This email is invalid' }
    let(:password) { 'This password is an invalid password' }
    let(:password_confirmation) { 'This password is an invalid password' }

    scenario 'I can see errors' do
      visit login_path
      expect(page).to have_content('Sign Up')
      expect(page).to_not have_content('Logout')
      click_link('Login')
      within('#login-user') do
        fill_in 'email', with: email
        fill_in 'password', with: password
        fill_in 'password_confirmation', with: password_confirmation
      end
      click_button('Login')
      expect(page).to have_link('Login')
      expect(page).to_not have_content('Logout')
      expect(page).to have_content('invalid')
      expect(page).to have_content('Sign Up')
    end
  end

  context 'As a credentialed user' do
    scenario 'I can log out' do
      create_current_user
      visit logout_url
      expect(page).to have_content('You have successfully logged out')
      expect(page).to_not have_content('Logout')
    end
  end
end

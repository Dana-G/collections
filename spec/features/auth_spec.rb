# spec/features/auth_spec.rb
require 'feature_helper'
RSpec.feature 'User authenticate' do
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }

  context 'As a non-credentialed member' do
    let(:user) do
      create(:user,
             email: email,
             password: password,
             password_confirmation: password
            )
    end

    context 'providing valid information' do
      scenario 'I can authenticate as a user of collections' do
        visit root_url
        expect(page).to have_content('Login')
        expect(page).not_to have_content('Logout')
        click_link('Login')
        within('#user-header') do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
        end
        click_button('Login')
        expect(page).to have_content('You are logged in')
        expect(page).to have_content('Logout')
        expect(page).to_not have_content('Login')
        expect(page).to_not have_content('Sign Up')
      end
    end
  end

  context 'As a non-credentialed user' do
    let(:password) { 'This password is an invalid password' }
    let(:user) do
      create(:user,
             email: 'boop@boo.com',
             password: 'expealidocious',
             password_confirmation: 'expealidocious'
            )
    end

    context 'providing invalid information' do
      scenario 'I can see errors' do
        visit root_url
        expect(page).to have_content('Login')
        expect(page).to_not have_content('Logout')
        click_link('Login')
        within('#user-header') do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password_confirmation
        end
        click_button('Login')
        expect(page).to have_content('Login')
        expect(page).to_not have_content('Logout')
        expect(page).to have content('This email is not registered')
        expect(page).to have content('This password is an invalid password')
      end
    end
  end

  context 'As a credentialed user' do
    scenario 'I can log out' do
    end
  end
end

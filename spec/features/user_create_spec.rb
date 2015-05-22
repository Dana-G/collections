require 'feature_helper'
RSpec.feature 'User create' do
  let(:username) { 'smallspark' }
  let(:email) { 'dgiordano@weblinc.com' }
  let(:password) { 'I am going to use a very secure password' }
  let(:password_confirmation) { 'I am going to use a very secure password' }

  context 'given I exist and am not logged in' do
    context 'when i visit the homepage' do
      scenario 'I am not logged in' do
        visit root_url
        expect(page).to have_title 'Collections'
        page.has_content?('Static#home')
        find_link('Sign Up').visible?
        find_link('Log In').visible?
      end
    end
  end
end

require 'feature_helper'
RSpec.feature 'User' do  create user good info  > bad info
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


context 'given I exist and am not logged in' do
    context 'when i visit the homepage' do
      scenario 'I can create a new account' do
        visit root_url
        expect(page).to have_title 'Collections'
        page.has_content?('Static#home')
        find_link('Sign Up').visible?
        find_link('Log In').visible?
      end
    end
  end



end

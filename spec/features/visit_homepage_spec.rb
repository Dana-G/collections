require 'feature_helper'
RSpec.feature 'VisitStaticHomePage' do
  context 'given I exist and am not logged in' do
    context 'when i visit the homepage' do
      scenario 'I see homepage content' do
        visit root_url
        expect(page).to have_title('Collections')
        expect(page).to have_content('Static#home')
      end
    end
  end
end

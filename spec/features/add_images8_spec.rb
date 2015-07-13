# spec/features/add_images8_spec.rb
require 'feature_helper'
RSpec.feature 'add images to albums' do
  let(:other_user) { create(:user) }
  let(:name) { 'kittehs' }
  let!(:user) { create_current_user }
  let!(:album) { create(:album, user: user) }

  context 'As an authenticated user with a collection' do
  end
    scenario 'I can add an image to that collection' do
      visit edit_album_path(album)
      page.attach_file('add image', './spec/factories/magical.jpg')
      click_button('submit')
      expect(page).to have_content('Image uploaded')
    end

    # scenario 'the first image defaults to primary image' do
    # end

    # scenario 'the primary image appears next to its link on user profile page' do
    # end

    # scenario 'primary image can be replaced by any image' do
    # end

    # scenario 'all images include a dropdown \'year\' for image year' do
    # end

    # scenario 'all images include a dropdown \'color\' for primary image color' do
    # end

    # scenario 'all images include a text description field' do

    # end
end

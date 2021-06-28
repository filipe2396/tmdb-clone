require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  let(:user) { create(:user, :with_favorites) }

  describe 'show page' do
    before do
      login_as user
      visit favorites_path
    end

    it 'shows user favorited movies' do
      expect(page).to have_content(user.favorites.first.title)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Home', type: :system do
  describe 'index' do
    let(:movie) { create(:movie) }

    before { movie }

    it 'shows recent added movies' do
      visit root_path
      expect(page).to have_content(movie.title)
    end
  end
end

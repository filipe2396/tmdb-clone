require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  context 'without results' do
    it 'shows a message' do
      visit "#{search_path}/movie"
      expect(page).to have_content t('searches.show.nothing_found')
    end
  end
end

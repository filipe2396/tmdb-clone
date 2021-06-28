require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  context 'without results' do
    before { allow_any_instance_of(TmdbClient).to receive(:search).and_return(OpenStruct.new(results: [])) }

    it 'shows a message' do
      visit search_path
      expect(page).to have_content t('searches.show.nothing_found')
    end
  end
end

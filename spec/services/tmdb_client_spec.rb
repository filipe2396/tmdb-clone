require 'rails_helper'

RSpec.describe TmdbClient do
  subject(:service) { described_class.new }

  describe '#search' do
    subject(:search) { service.search(query: 'Bradley', type: :multi) }

    it 'paginates the result' do
      expect(search).to respond_to(:current_page, :total_pages, :limit_value)
    end

    it 'transform values into an object' do
      expect(search[0]).to be_a OpenStruct
    end
  end
end

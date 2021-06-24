require 'rails_helper'

RSpec.describe TmdbClient do
  subject(:service) { described_class.new }

  describe '#search' do
    subject(:search) { service.search(query: 'Bradley', type: :multi) }

    it 'deeply transform values into an object' do
      expect(search).to be_a OpenStruct
      expect(search.results[0]).to be_a OpenStruct
    end
  end
end

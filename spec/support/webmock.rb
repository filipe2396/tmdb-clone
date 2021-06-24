WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before do
    stub_request(:any, /api.themoviedb.org\/3\/search\/multi/).to_return(
      body: File.open("#{File.dirname(__FILE__)}/fixtures/multi_search_result.json", 'rb').read,
      headers: { content_type: 'application/json' }
    )
  end
end

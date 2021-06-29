allowed_urls = []
allowed_urls += Webdrivers::Common.subclasses.map(&:base_url) if defined?(Webdrivers)

WebMock.disable_net_connect!(allow_localhost: true, allow: allowed_urls)

RSpec.configure do |config|
  config.before do
    stub_request(:any, /api.themoviedb.org\/3\/search\/multi/).to_return(
      body: File.open("#{File.dirname(__FILE__)}/fixtures/multi_search_result.json", 'rb').read,
      headers: { content_type: 'application/json' }
    )

    stub_request(:any, /api.themoviedb.org\/3\/search\/movie/).to_return(
      body: '{}',
      headers: { content_type: 'application/json' }
    )
  end
end

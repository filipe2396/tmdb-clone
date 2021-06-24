class TmdbClient
  include HTTParty

  base_uri 'api.themoviedb.org/3'

  def search(query:, type:)
    req = self.class.get("/search/#{type}", default_options.deep_merge(query: { query: query }))
    parse_response(req.parsed_response)
  end

  private

  def default_options
    @default_options ||= { query: { api_key: ENV['TMDB_API_KEY'], language: 'pt-BR' } }
  end

  def parse_response(obj)
    case obj
    when Hash
      OpenStruct.new(obj.transform_values { |val| parse_response(val) })
    when Array
      obj.map { |o| parse_response(o) }
    else
      obj
    end
  end
end

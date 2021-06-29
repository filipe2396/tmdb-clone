class TmdbClient
  include HTTParty

  base_uri 'api.themoviedb.org/3'

  def search(query:, type:, page: 1)
    req = self.class.get("/search/#{type}", default_options.deep_merge(query: { query: query, page: page }))
    parsed_response = parse_response(req.parsed_response)

    SaveMoviesJob.perform_later(req.parsed_response['results'], type)

    Kaminari.paginate_array(parsed_response.results || [], total_count: parsed_response.total_results || 0)
      .page(page)
      .per(20)
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

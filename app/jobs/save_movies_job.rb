class SaveMoviesJob < ApplicationJob
  queue_as :default

  def perform(results, type)
    return if results.empty? || %w[movie multi].exclude?(type.to_s)

    results = results.map(&:with_indifferent_access)
    movies = type.to_s == 'movie' ? results : results.select { |resource| resource[:media_type] == 'movie' }

    create_movies(movies)
  end

  private

  def create_movies(movies)
    movies.each do |movie|
      next if Movie.find_by(tmdb_id: movie[:id])

      permitted_attribute = movie.slice(
        :title, :release_date, :overview, :poster_path, :vote_average, :vote_count
      ).merge(tmdb_id: movie[:id])

      Movie.create(permitted_attribute)
    end
  end
end

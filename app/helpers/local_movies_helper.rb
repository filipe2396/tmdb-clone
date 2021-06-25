module LocalMoviesHelper
  def movie_form_path(movie)
    movie.persisted? ? local_movie_path(movie) : local_movies_path
  end
end

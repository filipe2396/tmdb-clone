module LocalMoviesHelper
  def movie_form_path(movie)
    movie.persisted? ? local_movie_path(movie) : local_movies_path
  end

  def favorite_icon(movie)
    if user_signed_in? && current_user.favorites.exists?(movie.id)
      action = 'unfavorite'
      icon_type = 'fas'
    else
      action = 'favorite'
      icon_type = 'far'
    end

    link_to favorite_local_movie_path(movie, type: action), method: :post, class: 'text-decoration-none' do
      safe_join([icon(icon_type, 'heart', class: 'fa-lg text-danger me-2'), tag.span(t(".#{action}"))])
    end
  end
end

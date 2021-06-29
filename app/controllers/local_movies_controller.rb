class LocalMoviesController < ApplicationController
  before_action :authenticate_user!, only: :favorite
  before_action :set_movie, only: %i[edit update destroy favorite]

  def index
    @movies = Movie.all.order(created_at: :desc).page(params[:page])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(permitted_params)

    if @movie.save
      redirect_to local_movies_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @movie.update(permitted_params)
      redirect_to local_movies_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      options = { notice: t('.success') }
    else
      options = { alert: t('.failed') }
    end

    redirect_to local_movies_path, **options
  end

  def favorite
    case params[:type]
    when 'favorite'
      current_user.favorites << @movie
      flash.notice = t('.favorited')
    when 'unfavorite'
      current_user.favorites.delete(@movie)
      flash.notice = t('.unfavorited')
    end

    redirect_back fallback_location: favorites_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def permitted_params
    params.require(:movie).permit(:tmdb_id, :title, :release_date, :overview, :poster_path, :vote_average, :vote_count)
  end
end

class HomeController < ApplicationController
  def index
    @last_movies = Movie.order(created_at: :desc).first(5)
  end
end

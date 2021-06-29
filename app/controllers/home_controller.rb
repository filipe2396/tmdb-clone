class HomeController < ApplicationController
  def index
    @last_movies = Movie.order(created_at: :desc).first(10)
  end
end

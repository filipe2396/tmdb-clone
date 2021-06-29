class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def show
    @favorites = current_user.favorites.page(params[:page])
  end
end

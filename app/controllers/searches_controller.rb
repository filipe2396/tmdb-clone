class SearchesController < ApplicationController
  def show
    @results = TmdbClient.new.search(query: params[:query], type: params[:media_type] || :multi, page: params[:page])
  end
end

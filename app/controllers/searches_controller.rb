class SearchesController < ApplicationController
  def show
    @response = TmdbClient.new.search(query: params[:query], type: params[:media_type] || :multi)
  end
end

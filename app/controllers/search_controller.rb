class SearchController < ApplicationController
  def index
    @stations = Station.filter_by_zip(params[:q])
  end
end

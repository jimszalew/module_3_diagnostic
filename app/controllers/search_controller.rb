class SearchController < ApplicationController
  def index
    @stations = NrelService.new(search)




    search = params[:q]

    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG,ELEC&location=#{search}&radius=6&limit=10"

    json_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = json_stations.map do |station|
      Station.new(station)
    end
  end
end

class SearchController < ApplicationController
  def index
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG,ELEC"

    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    require "pry"; binding.pry

    @stations = raw_stations.map do |station|
      Station.new(station)
    end
  end
end

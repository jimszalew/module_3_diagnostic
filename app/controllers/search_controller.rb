class SearchController < ApplicationController
  def index
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG,ELEC"

    @stations = JSON.parse(response.body, symbolize_names: true)

      require "pry"; binding.pry
  end
end

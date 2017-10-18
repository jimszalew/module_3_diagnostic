class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_api_key']}") do |faraday|
      faraday.headers['fuel_type'] = 'LPG,ELEC'
      faraday.adapter Faraday.default_adapter
      require "pry"; binding.pry
    end
  end
end

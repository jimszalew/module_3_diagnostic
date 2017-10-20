class NrelService
  def self.stations_by_zip(zip)
    response = Faraday.get "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG,ELEC&location=#{zip}&radius=6&limit=10"
    json_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end

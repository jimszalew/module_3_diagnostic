class NrelService
  def initialize
    @conn = Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def stations_by_zip(zip)
    parameters = {
      api_key: ENV['nrel_api_key'],
      fuel_type: 'LPG,ELEC',
      location: zip,
      radius: 6,
      limit: 10
    }
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json", parameters)
    json_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.stations_by_zip(zip)
    new.stations_by_zip(zip)
  end
end

class Station < ActiveRecord::Base
  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(station_data)
    @name         = station_data[:station_name]
    @address      = station_data[:street_address]
    @fuel_types   = station_data[:fuel_type_code]
    @distance     = station_data[:distance]
    @access_times = station_data[:access_days_time]
  end

  def self.filter_by_zip(zip)
    json_stations = NrelService.stations_by_zip(zip)
    json_stations.map do |station|
      Station.new(station)
    end
  end
end

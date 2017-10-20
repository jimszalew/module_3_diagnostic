require 'rails_helper'

RSpec.describe Station, type: :model do

  let(:station) { Station.new(
                  station_name: "Station!",
                  street_address: "123 Bing St.",
                  fuel_type_code: "LPG,ELEC",
                  distance: 6,
                  access_days_time: "some time ago"
                )}

  context 'class_methods' do
    context '#initialize' do
      it 'exists' do
        VCR.use_cassette('models/station') do
          expect(station).to be_a Station
        end
      end
    end
  end

  context 'instance_methods' do
    VCR.use_cassette('models/station_methods') do
      context '.name' do
        it 'returns the station name' do
          expect(station.name).to eq "Station!"
        end
      end
      context '.address' do
        it 'returns the station address' do
          expect(station.address).to eq "123 Bing St."
        end
      end
      context '.fuel_types' do
        it 'returns the station fuel_types' do
          expect(station.fuel_types).to eq "LPG,ELEC"
        end
      end
      context '.distance' do
        it 'returns the station distance' do
          expect(station.distance).to eq 6
        end
      end
      context '.access_times' do
        it 'returns the station access_times' do
          expect(station.access_times).to eq "some time ago"
        end
      end
      context '.filter_by_zip' do
        it 'returns stations filtered by zipcode' do
          stations = Station.filter_by_zip('80203')
          expect(stations.count).to eq 10
          expect(stations.first).to be_a Station
        end
      end
    end
  end
end

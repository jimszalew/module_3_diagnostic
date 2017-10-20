require 'rails_helper'

RSpec.describe 'NrelService' do

  context 'class_methods' do
    context '.stations_by_zip' do
      it 'returns an array of stations filtered by zip code' do
        raw_stations = NrelService.stations_by_zip('80203')
        expect(raw_stations.count).to eq 10
      end
    end
  end
end

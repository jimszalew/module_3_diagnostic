require 'rails_helper'

RSpec.describe Station, type: :model do

  let(:station) {{
                  name: "Station!",
                  address: "123 Bing St.",
                  fuel_types: "LPG,ELEC",
                  distance: "6",
                  access_times: "some time ago"
                }}

  context 'class_methods' do
    context '#initialize' do
      it 'exists' do
        VCR.use_cassette('models/station') do
          expect(Station.new(station)).to be_a Station
        end
      end
    end
  end
end

  # context 'instance_methods' do
  #   context '.name' do
  #
  #   end
  #   context '.address' doc
  #
  #   end
  #   context '.fuel_types' do
  #
  #   end
  #   context '.distance' do
  #
  #   end
  #   context '.access_times' do
  #
  #   end
  # end

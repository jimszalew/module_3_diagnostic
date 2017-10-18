require 'rails_helper'

RSpec.describe 'A user visits the root path' do
  context 'enters parameters and clicks Locate' do
    VCR.use_cassette('features/station_search') do
      it 'and sees a list of stations' do

        visit '/'

        fill_in 'q', with: '80203'

        click_on 'Locate'

        expect(current_path).to eq search_path
        expect(page).to have_content('10 Stations within 6 miles')
        expect(page).to have_css('.station', count: 10)

        within(first('.station')) do
          expect(page).to have_css('.name')
          expect(page).to have_css('.address')
          expect(page).to have_css('.fuel_types')
          expect(page).to have_css('.distance')
          expect(page).to have_css('.access_times')
        end

        expect(page).to_not have_content('BD')
        expect(page).to_not have_content('CNG')
        expect(page).to_not have_content('E85')
        expect(page).to_not have_content('HY')
        expect(page).to_not have_content('LNG')
      end
    end
  end
end

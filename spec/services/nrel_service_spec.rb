require 'rails_helper'

RSpec.describe 'NrelService' do

  let(:nrel) { NrelService.new('80203') }

  context 'class_methods' do
    context '#initialize' do
      it 'exists' do
        expect(nrel).to be_a NrelService
      end
    end
  end
end

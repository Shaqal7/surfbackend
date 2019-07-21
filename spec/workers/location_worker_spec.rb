require 'rails_helper'
RSpec.describe LocationWorker, type: :worker do
  let(:location) { FactoryBot.create(:location, forecast: nil, latitude: 1, longitude: 1) } 
  describe '#perform' do
    it 'should update the forecast attribute of location' do
      LocationWorker.new.perform(location.id)
      expect(location.reload.forecast).not_to be nil
    end

    it 'should trigger runtime error if api fails' do
      allow_any_instance_of(StormGlass).to receive(:weather).and_return({errors: 'some error'})
      expect{Location.new.perform(location.id)}.to raise_error(RuntimeError)
    end
  end
end

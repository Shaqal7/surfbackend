require 'rails_helper'
require 'scraper/spot'

describe Scraper::Spot do 
  subject { Scraper::Spot.new("https://www.wannasurf.com/spot/Asia/Indonesia/Bali/airports/index.html") }
  let(:attributes) {{ direction: "Right and left", experience: "All surfers", frequency: "Sometimes break", type: "Reef-coral", wave_quality: "Normal", name: "Airport's", latitude: "-8.745124", longitude: "115.150323" }}

  describe "retrieves spot information" do
    it "#name" do 
      expect(subject.name).to eql "Airport's"
    end

    it "#latitude" do
      expect(subject.latitude).to eql "-8.745124"
    end

    it "#longitude" do
      expect(subject.longitude).to eql "115.150323"
    end

    it "#additional_information" do
      expect(subject.additional_information).to match "Airport's right and left need quite a big"
    end

    it "#gps" do
      expect(subject.gps.title).to match "GPS location"
      expect(subject.spot).not_to match "GPS location"
    end

    it "#attributes" do 
      subject.set_attributes
      expect(subject.attributes).to match attributes
    end
  end
end

require 'rails_helper'
require 'scraper'
require 'scraper/spot'

describe Scraper::Spot do 
  subject { Scraper::Spot.new("#{Scraper::WEBSITE}/spot/Asia/Indonesia/Bali/airports/index.html") }
  let(:geger) { Scraper::Spot.new "#{Scraper::WEBSITE}/spot/Asia/Indonesia/Bali/geger/index.html" }
  let(:attributes) {{ direction: "Right and left", experience: "All surfers", frequency: "Sometimes break", type: "Reef-coral", wave_quality: "Normal", name: "Airport's", latitude: "-8.745124", longitude: "115.150323" }}

  describe "retrieves spot information" do
    it "#name" do 
      expect(subject.name).to eql "Airport's"
    end

    it "#gps?" do
      subject.gps
      expect(subject.gps?).to be true
    end

    it "#coordinates" do
      expect(subject.coordinates[0].text).to eql "-8.745124"
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

    it "#attributes" do 
      subject.set_attributes
      expect(subject.attributes).to match attributes
    end
    
    it "#attributes with layout issues" do
      expect(geger.attributes[:name]).to eql "Geger"
      expect(geger.attributes[:experience]).to eql "Experienced surfers"
    end
  end
end

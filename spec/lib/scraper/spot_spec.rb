require 'rails_helper'
require 'scraper'
require 'scraper/spot'

describe Scraper::Spot do 
  subject do 
    Scraper::Spot.new("#{ENV["WEBSITE"]}/spot/Asia/Indonesia/Bali/airports/index.html")
  end

  let(:geger) do 
    Scraper::Spot.new "#{ENV["WEBSITE"]}/spot/Asia/Indonesia/Bali/geger/index.html" 
  end

  let(:attributes) {{ direction: "Right and left", experience: "All surfers", frequency: "Sometimes break", bottom: "Reef-coral", wave_quality: "Normal", name: "Airport's", latitude: "-8.745124", longitude: "115.150323", pictures: "" }}

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
      expect(subject.attributes[:pictures].size).to be 11
      subject.attributes[:pictures] = ""
      expect(subject.attributes).to match attributes
    end
    
    it "#attributes with layout issues" do
      expect(geger.attributes[:name]).to eql "Geger"
      expect(geger.attributes[:experience]).to eql "Experienced surfers"
    end

    it "#pictures" do
      picture1 = "#{ENV['WEBSITE']}/spot/Asia/Indonesia/Bali/airports/photo/photo_surf_Indonesia_Bali_airports_451d7ee651d4d.jpg"
      picture2 = "#{ENV['WEBSITE']}/spot/Asia/Indonesia/Bali/airports/photo/photo40250326ce125.jpg"
      expect(subject.pictures).to include picture1
      expect(subject.pictures).to include picture2
      expect(subject.pictures.size).to be 11 
      expect(subject.pictures).to be_instance_of Array
    end
  end
end

require 'rails_helper'
require 'scraper/spot'

describe Scraper::Spot do 
  let(:attributes) {{ direction: "Right and left", experience: "All surfers", frequency: "Sometimes break", type: "Reef-coral", wave_quality: "Normal" }}

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

    it "#attributes" do 
      subject.set_attributes
      expect(subject.attributes).to eql attributes
    end

    it "#quality" do 
      expect(subject.quality).to eql "Normal"
    end

    it "#experience" do
      expect(subject.experience).to eql "All surfers"
    end

    it "#frequency" do
      expect(subject.frequency).to eql "Sometimes break"
    end

    it "#direction" do
      expect(subject.direction).to eql "Right and left"
    end

    it "#bottom" do
      expect(subject.bottom).to eql "Reef-coral"
    end
  end
end

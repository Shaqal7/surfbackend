require 'rails_helper'
require 'scraper/spot'

describe Scraper::Spot do 
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

  describe "runs operations for all surfspots"
  describe "saves to database"
  describe "query all the info in the database and generate new seeds file"

end

require 'rails_helper'
require 'scraper/country'

describe Scraper::Country do
  subject { Scraper::Country.new(Scraper::INDO) }
  let(:indo) { Scraper::Country.new(Scraper::INDO) }
  let(:usa) { Scraper::Country.new(Scraper::USA) }
  let(:arz) { Scraper::Country.new(Scraper::ARZEBAIJAN) }

  describe "retrieves information about" do
    it "#name" do
      expect(indo.name).to eql "Indonesia"
      expect(usa.name).to eql "United States of America"
      expect(arz.name).to eql "Azerbaijan"
    end

    it "#with_zone?" do 
      expect(indo.with_zone?).to be true
      expect(usa.with_zone?).to be true
      expect(arz.with_zone?).to be false
    end

    it "#areas_table" do
      expect(subject.areas_table.size).to eql 13
      expect(subject.areas_table[0].children.text).to eql "Sulawesi"
      expect(subject.areas_table[12].children.text).to eql "Papua"
    end

    it "#areas" do
      expect(subject.areas.size).to eql 13
      expect(subject.areas[0]).to eql "Sulawesi"
      expect(subject.areas[3]).to eql "Lombok"
    end

    it "#hrefs" do
      expect(subject.hrefs[0]).to eql "/spot/Asia/Indonesia/Sulawesi/index.html"
      expect(subject.hrefs[12]).to eql "/spot/Asia/Indonesia/Papua/index.html" 
    end

    it "#set_spot" do
      path = Scraper::Path.new("/spot/Asia/Indonesia/Sulawesi/index.html")
      subject.send(:spots, [])
      subject.set_spots(path)
      expect(subject.spots.size).to be > 0
      expect(subject.spots.size).to be 1
      expect(subject.spots.first).to be_instance_of(Scraper::Spot)
      expect(subject.spots.first.attributes[:latitude]).to eql "0.488199" 
    end
  end

  describe "runs operations for all surfspots with" do
    it "#scrape_country" do
      subject.scrape_country
      spots = subject.spots
      expect(spots[0]).to be_instance_of Scraper::Spot
      expect(spots[1]).to be_instance_of Scraper::Spot
      expect(spots.size).to eql 216
      expect(spots[0].attributes[:name]).to eql "Gorontalo beach"
      expect(spots[1].attributes[:longitude]).to_not be_empty
      expect(spots.last.attributes[:longitude]).to_not be_empty
    end
  end

  describe "saves to database" do
  end

  describe "query all the info in the database and generate new seeds file"
end

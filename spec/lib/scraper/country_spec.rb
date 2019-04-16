require 'rails_helper'
require 'scraper/country'

describe Scraper::Country do
  subject { Scraper::Country.new(ENV['INDO']) }
  let(:indo) { Scraper::Country.new(ENV['INDO']) }
  let(:usa) { Scraper::Country.new(ENV['USA']) }
  let(:arz) { Scraper::Country.new(ENV['ARZEBAIJAN']) }
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
  end

  describe "saves to database with" do
    before(:each) do 
      hrefs_stub = [ENV["SULAWESI"]]
      table_stub = instance_double("Spots")
      links_stub = [ENV["GORONTALO"]]
      allow(subject).to receive(:hrefs).and_return(hrefs_stub)
      allow(subject).to receive(:spots_table).and_return(table_stub)
      allow(table_stub).to receive(:map).and_return(links_stub)
    end

    it "#scrape_country" do
      expect {
        subject.scrape_country
      }.to change(Location, :count).by 1
      expect(Location.first.latitude).to eql "0.488199"
      expect(Location.first.longitude).to eql "122.992094" 
      expect(Location.first.name).to eql "Gorontalo beach"
      expect(Location.first.area).to eql "Sulawesi"
      expect(Location.first.country).to eql "Indonesia"
    end

    it "#scrape_country but skips duplicates" do
      Location.create(name: "Gorontalo beach", country: "Indonesia")
      expect {
        subject.scrape_country
      }.to change(Location, :count).by 0
    end
  end

  describe "query all the info in the database and generate new seeds file"
end

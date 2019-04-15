require 'rails_helper'
require 'scraper/country'

describe Scraper::Country do
  subject { Scraper::Country.new(Scraper::INDO) }
  let(:indo) { Scraper::Country.new(Scraper::INDO) }
  let(:usa) { Scraper::Country.new(Scraper::USA) }
  let(:arz) { Scraper::Country.new(Scraper::ARZEBAIJAN) }

  describe "retrieves information about" do
    it "#with_zone?" do 
      expect(indo.with_zone?).to be true
      expect(usa.with_zone?).to be true
      expect(arz.with_zone?).to be false
    end

    it "#zones" do
      expect(subject.zones.size).to eql 13
      expect(subject.zones[0].children.text).to eql "Sulawesi"
      expect(subject.zones[12].children.text).to eql "Papua"
    end

    it "#hrefs" do
      expect(subject.hrefs[0]).to eql "/spot/Asia/Indonesia/Sulawesi/index.html"
      expect(subject.hrefs[12]).to eql "/spot/Asia/Indonesia/Papua/index.html" 
    end
  end

  describe "runs operations for all surfspots"
  describe "saves to database"
  describe "query all the info in the database and generate new seeds file"
end

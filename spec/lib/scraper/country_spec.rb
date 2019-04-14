require 'rails_helper'
require 'scraper/country'

describe Scraper::Country do
  describe "retrieves information about" do
    it "#islands" do
      expect(subject.islands.size).to eql 12
      expect(subject.islands[0]).to eql "Sulawesi"
      expect(subject.islands[12]).to eql "Papua"
    end

    it "#hrefs" do
      expect(subject.hrefs[0]).to eql "/spot/Asia/Indonesia/Sulawesi/index.html"
      expect(subject.hrefs[12]).to eql "/spot/Asia/Indonesia/Papua/index.html" 
    end

    it "#links" do
      expect(subject.links[0]).to eql "/spot/Asia/Indonesia/Sulawesi/index.html" 
      expect(subject.links[12]).to eql "/spot/Asia/Indonesia/Papua/index.html"
    end
  end

  describe "runs operations for all surfspots"
  describe "saves to database"
  describe "query all the info in the database and generate new seeds file"
end

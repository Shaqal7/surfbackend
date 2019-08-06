require 'rails_helper'
require 'scraper/country'
require 'api/storm'

describe Scraper::Country do
  subject { Scraper::Country.new(ENV['INDO']) }
  let(:usa) { Scraper::Country.new(ENV['USA']) }
  let(:arz) { Scraper::Country.new(ENV['ARZEBAIJAN']) }

  describe "retrieves information about" do
    it "#name" # do
#      expect(subject.name).to eql "Indonesia"
#      expect(usa.name).to eql "United States of America"
#      expect(arz.name).to eql "Azerbaijan"
#    end

    it "#with_zone?" # do 
#      expect(subject.with_zone?).to be true
#      expect(usa.with_zone?).to be true
#      expect(arz.with_zone?).to be false
#    end

    it "#areas_table" # do
#      expect(subject.areas_table.size).to eql 13
#      expect(subject.areas_table[0].children.text).to eql "Sulawesi"
#      expect(subject.areas_table[12].children.text).to eql "Papua"
#    end

    it "#areas" # do
#      expect(subject.areas.size).to eql 13
#      expect(subject.areas[0]).to eql "Sulawesi"
#      expect(subject.areas[3]).to eql "Lombok"
#    end

    it "#hrefs" # do
#      expect(subject.hrefs[0]).to eql "/spot/Asia/Indonesia/Sulawesi/index.html"
#      expect(subject.hrefs[12]).to eql "/spot/Asia/Indonesia/Papua/index.html" 
#    end
  end

  describe "saves to database using" do
    context "one mocked data with" do
      before(:each) do 
        hrefs_stub = [ENV["SULAWESI"]]
        table_stub = instance_double("Spots")
        links_stub = [ENV["GORONTALO"]]
        allow(subject).to receive(:hrefs).and_return(hrefs_stub)
        allow(subject).to receive(:spots_table).and_return(table_stub)
        allow(table_stub).to receive(:map).and_return(links_stub)
      end

      it "#scrape"
#        forecast_data = [{"waveHeight"=> [{"source"=> "msw", "height"=> 10}, {"source"=> "other", "height"=> 1}]}, "waveDirection"=> [{"source"=> "msw", "direction"=> 0}]]
#        tide = instance_double("tide")
#        allow_any_instance_of(Storm).to receive(:getWaveForecast).and_return(forecast_data)
#        allow_any_instance_of(Storm).to receive(:getTide).and_return(tide)
#        location = instance_double("location")
#        allow_any_instance_of(Post).to receive(:location).and_return(location)
#        expect {
#          subject.scrape
#        }.to change(Location, :count).by 1
#        expect(Location.first.latitude).to eql "0.488199"
#        expect(Location.first.longitude).to eql "122.992094" 
#        expect(Location.first.name).to eql "Gorontalo beach"
#        expect(Location.first.area).to eql "Sulawesi"
#        expect(Location.first.country).to eql "Indonesia"


      it "#scrape but skips duplicates" 
#        Location.create(name: "Gorontalo beach", country: "Indonesia")
#        expect {
#          subject.scrape
#        }.to change(Location, :count).by 0
#      end
    end

    context "real data with" do 
      it "#scrape" # do
#        subject.scrape
#        army = Location.find_by(name: "Army Camp")
#        expect(army.attributes["area"]).to eql "Sumba, Flores, Savu, Timor"
#        expect(army.attributes["latitude"]).to eql '-10.97949'
#        expect(army.attributes["longitude"]).to eql '122.843375'
#        expect(army.attributes["experience"]).to eql 'All surfers'
#      end

      it "#scrape_scountry that do not have zones" # do
#        lanka = Scraper::Country.new "#{ENV['WEBSITE']}/spot/Asia/Sri_Lanka/"
#        lanka.scrape
#        location = Location.find_by(name: "the peaks")
#        expect(location.attributes["country"]).to eql "Sri Lanka"
#      end
    end
  end

  describe "query all the info in the database and generate new seeds file"
end

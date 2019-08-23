require 'rails_helper'
require 'continent'

describe Continent do
  let(:continent) { Continent.new("https://www.wannasurf.com/spot/North_America/index.html") }
  describe '#countries' do
    it 'returns the country links' do
      expect(continent.countries).to eql ["/spot/North_America/Canada/index.html", "/spot/North_America/USA/index.html"]
    end
  end

  describe '#scrape' 
    it 'persist the new spots to the database'
      # expect(continent.scrape).to 
end

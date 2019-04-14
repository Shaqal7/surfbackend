require 'mechanize'

module Scraper
  class Country
  end
  class Spot < Mechanize
    WEBSITE = "https://www.wannasurf.com"
    INDO = "/spot/Asia/Indonesia"

    def airport
      get("#{WEBSITE}#{INDO}/Bali/airports/index.html")
    end

    def name 
      airport.search("a.wanna-item-title-title").text
    end

    def info
      airport.search("h3.wanna-item")
    end

    def characteristics
      info[1].next_element.children.search("p")
    end

    def additional_information
      info[2].next_element.text
    end

    def quality
      characteristics[0].children[1].text
    end

    def experience
      characteristics[1].children[1].text
    end
    
    def frequency
      characteristics[2].children[1].text
    end

    def bottom
      characteristics[3].children[1].text
    end

    def direction
      characteristics[4].children[1].text
    end

    def gps
      airport.link_with(text: "GPS History (1)").click
    end

    def coordinates
      gps.at("table table[width='100%'] tr:last-child td:first-child").children
    end

    def latitude
      coordinates[0].text
    end

    def longitude
      coordinates[2].text.lstrip
    end
  end
end

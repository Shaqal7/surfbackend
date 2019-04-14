require 'mechanize'

class Scraper < Mechanize
  WEBSITE = "https://www.wannasurf.com"
  INDO = "/spot/Asia/Indonesia"

  def airports
    get("#{WEBSITE}#{INDO}/Bali/airports/index.html")
  end

  def gps
    airports.link_with(text: "GPS History (1)").click
  end

  def coordinates
    page.at("table table[width='100%'] tr:last-child td:first-child").children
  end

  def latitude
    coordinates[0].text
  end

  def longitude
    coordinates[2].text.lstrip
  end
end

require 'open-uri'
require 'nokogiri'

def set_departure
case current_user.airport_code
  when "New York"
    "JFK"
  when "Amsterdam"
    "AMS"
  when "Los Angeles"
    "LAX"
  when "Rio De Janero"
    "GIG"
  when "Sydney"
    "SYD"
  when "Tokoyo"
    "HND"
  when "Cairo"
    "CAI"
  when "Frankfurt"
    "FRA"
  when "Moscow"
    "DME"
  when "Atlanta"
    "ATL"
  when "Toronto"
    "YYZ"
  when "London"
    "YXU"
  when "New Dheli"
    "DEL"
  when "Dubai"
    "DXB"
  when "Shanghai"
    "PVG"
  when "Hong Kong"
    "HKG"
  end
end

def scrape
  destination_code = @country.airport_code
  departure_code = set_departure
  url = "http://www.hopper.com/flights/from-#{departure_code}/to-#{destination_code}/guide"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  puts url
  html_doc.search('.legend-label').each do |element|
    slip = element.text.strip
  end
end

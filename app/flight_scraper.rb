require 'open-uri'
require 'nokogiri'


destination_code = "LCY"
departure_code = "BOS"
departure_date = "10/10/2018"
url = "http://www.hopper.com/flights/from-#{departure_code}/to-#{destination_code}/guide"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
puts url
html_doc.search('.legend-label').each do |element|
  puts element.text.strip
end

require 'json'
require 'open-uri'

x = [
{country: "Afghanistan", city: "Kabul"},
{country: "Albania", city: "Tirana"},
{country: "Algeria", city: "Alger"},
{country: "Andorra", city: "Andorra la Vella"},
{country: "Angola", city: "Luanda"},
{country: "Anguilla", city: "The Valley"},
{country: "Antigua and Barbuda", city: "Saint John's"},
{country: "Argentina", city: "Buenos Aires"},
{country: "Armenia", city: "Yerevan"},
{country: "Aruba", city: "Oranjestad"},
{country: "Australia", city: "Canberra"},
{country: "Austria", city: "Wien"},
{country: "Azerbaijan", city: "Baku"},
{country: "Bahamas", city: "Nassau"},
{country: "Bahrain", city: "al-Manama"},
{country: "Bangladesh", city: "Dhaka"},
{country: "Barbados", city: "Bridgetown"},
{country: "Belarus", city: "Minsk"},
{country: "Belgium", city: "Bruxelles [Brussel]"},
{country: "Belize", city: "Belmopan"},
{country: "Benin", city: "Porto-Novo"},
{country: "Bermuda", city: "Hamilton"},
{country: "Bhutan", city: "Thimphu"},
{country: "Bolivia", city: "La Paz"},
{country: "Bosnia and Herzegovina", city: "Sarajevo"},
{country: "Botswana", city: "Gaborone"},
{country: "Brazil", city: "Brasília"},
{country: "Brunei", city: "Bandar Seri Begawan"},
{country: "Bulgaria", city: "Sofia"},
{country: "Burkina Faso", city: "Ouagadougou"},
{country: "Burundi", city: "Bujumbura"},
{country: "Cambodia", city: "Phnom Penh"},
{country: "Cameroon", city: "Yaound"},
{country: "Canada", city: "Ottawa"},
{country: "Cape Verde", city: "Praia"},
{country: "Central African Republic", city: "Bangui"},
{country: "Chad", city: "N'Djam"},
{country: "Chile", city: "Santiago de Chile"},
{country: "China", city: "Beijing"},
{country: "Colombia", city: "Santaf"},
{country: "Comoros", city: "Moroni"},
{country: "Congo", city: "Brazzaville"},
{country: "Congo, The Democratic Republic of the", city: "Kinshasa"},
{country: "Costa Rica", city: "San Jos"},
{country: "Ivory Coast", city: "Yamoussoukro"},
{country: "Croatia", city: "Zagreb"},
{country: "Cuba", city: "La Habana"},
{country: "Cyprus", city: "Nicosia"},
{country: "Czech Republic", city: "Praha"},
{country: "Denmark", city: "Copenhagen"},
{country: "Djibouti", city: "Djibouti"},
{country: "Dominica", city: "Roseau"},
{country: "Dominican Republic", city: "Santo Domingo de Guzm"},
{country: "East Timor", city: "Dili"},
{country: "Ecuador", city: "Quito"},
{country: "Egypt", city: "Cairo"},
{country: "England", city: "London"},
{country: "El Salvador", city: "San Salvador"},
{country: "Equatorial Guinea", city: "Malabo"},
{country: "Eritrea", city: "Asmara"},
{country: "Estonia", city: "Tallinn"},
{country: "Ethiopia", city: "Addis Abeba"},
{country: "Fiji Islands", city: "Suva"},
{country: "Finland", city: "Helsinki [Helsingfors]"},
{country: "France", city: "Paris"},
{country: "French Guiana", city: "Cayenne"},
{country: "French Polynesia", city: "Papeete"},
{country: "Gabon", city: "Libreville"},
{country: "Gambia", city: "Banjul"},
{country: "Georgia", city: "Tbilisi"},
{country: "Germany", city: "Berlin"},
{country: "Ghana", city: "Accra"},
{country: "Gibraltar", city: "Gibraltar"},
{country: "Greece", city: "Athenai"},
{country: "Greenland", city: "Nuuk"},
{country: "Grenada", city: "Saint George's"},
{country: "Guadeloupe", city: "Basse-Terre"},
{country: "Guam", city: "Aga"},
{country: "Guatemala", city: "Ciudad de Guatemala"},
{country: "Guinea", city: "Conakry"},
{country: "Guinea-Bissau", city: "Bissau"},
{country: "Guyana", city: "Georgetown"},
{country: "Haiti", city: "Port-au-Prince"},
{country: "Honduras", city: "Tegucigalpa"},
{country: "Hong Kong", city: "Victoria"},
{country: "Hungary", city: "Budapest"},
{country: "Iceland", city: "Reykjav"},
{country: "India", city: "New Delhi"},
{country: "Indonesia", city: "Jakarta"},
{country: "Iran", city: "Tehran"},
{country: "Iraq", city: "Baghdad"},
{country: "Ireland", city: "Dublin"},
{country: "Israel", city: "Jerusalem"},
{country: "Italy", city: "Roma"},
{country: "Jamaica", city: "Kingston"},
{country: "Japan", city: "Tokyo"},
{country: "Jordan", city: "Amman"},
{country: "Kazakstan", city: "Astana"},
{country: "Kenya", city: "Nairobi"},
{country: "Kiribati", city: "South Tarawa"},
{country: "Kuwait", city: "Kuwait"},
{country: "Kyrgyzstan", city: "Bishkek"},
{country: "Laos", city: "Vientiane"},
{country: "Latvia", city: "Riga"},
{country: "Lebanon", city: "Beirut"},
{country: "Lesotho", city: "Maseru"},
{country: "Liberia", city: "Monrovia"},
{country: "Libya", city: "Tripoli"},
{country: "Liechtenstein", city: "Vaduz"},
{country: "Lithuania", city: "Vilnius"},
{country: "Luxembourg", city: "Luxembourg"},
{country: "Macao", city: "Macao"},
{country: "Macedonia", city: "Skopje"},
{country: "Madagascar", city: "Antananarivo"},
{country: "Malawi", city: "Lilongwe"},
{country: "Malaysia", city: "Kuala Lumpur"},
{country: "Maldives", city: "Male"},
{country: "Mali", city: "Bamako"},
{country: "Malta", city: "Valletta"},
{country: "Marshall Islands", city: "Dalap-Uliga-Darrit"},
{country: "Martinique", city: "Fort-de-France"},
{country: "Mauritania", city: "Nouakchott"},
{country: "Mauritius", city: "Port-Louis"},
{country: "Mayotte", city: "Mamoutzou"},
{country: "Mexico", city: "Ciudad de M"},
{country: "Micronesia, Federated States of", city: "Palikir"},
{country: "Moldova", city: "Chisinau"},
{country: "Monaco", city: "Monaco-Ville"},
{country: "Mongolia", city: "Ulan Bator"},
{country: "Morocco", city: "Rabat"},
{country: "Mozambique", city: "Maputo"},
{country: "Myanmar", city: "Rangoon"},
{country: "Namibia", city: "Windhoek"},
{country: "Nauru", city: "Yaren"},
{country: "Nepal", city: "Kathmandu"},
{country: "Netherlands", city: "Amsterdam"},
{country: "New Caledonia", city: "Noum"},
{country: "New Zealand", city: "Wellington"},
{country: "Nicaragua", city: "Managua"},
{country: "Niger", city: "Niamey"},
{country: "Nigeria", city: "Abuja"},
{country: "Niue", city: "Alofi"},
{country: "Northern Ireland", city: "Belfast"},
{country: "Norway", city: "Oslo"},
{country: "Oman", city: "Masqat"},
{country: "Pakistan", city: "Islamabad"},
{country: "Palau", city: "Koror"},
{country: "Palestine", city: "Gaza"},
{country: "Panama", city: "Ciudad de Panam"},
{country: "Papua New Guinea", city: "Port Moresby"},
{country: "Paraguay", city: "Asunci"},
{country: "Peru", city: "Lima"},
{country: "Philippines", city: "Manila"},
{country: "Poland", city: "Warszawa"},
{country: "Portugal", city: "Lisboa"},
{country: "Puerto Rico", city: "San Juan"},
{country: "Qatar", city: "Doha"},
{country: "Romania", city: "Bucuresti"},
{country: "Russian Federation", city: "Moscow"},
{country: "Rwanda", city: "Kigali"},
{country: "Saint Kitts and Nevis", city: "Basseterre"},
{country: "Saint Lucia", city: "Castries"},
{country: "Saint Vincent and the Grenadines", city: "Kingstown"},
{country: "Samoa", city: "Apia"},
{country: "Sao Tome and Principe", city: "Sao Tome"},
{country: "Saudi Arabia", city: "Riyadh"},
{country: "Scotland", city: "Edinburgh"},
{country: "Senegal", city: "Dakar"},
{country: "Seychelles", city: "Victoria"},
{country: "Serbia", city: "Belgrade"},
{country: "Sierra Leone", city: "Freetown"},
{country: "Singapore", city: "Singapore"},
{country: "Slovakia", city: "Bratislava"},
{country: "Slovenia", city: "Ljubljana"},
{country: "Solomon Islands", city: "Honiara"},
{country: "Somalia", city: "Mogadishu"},
{country: "South Africa", city: "Pretoria"},
{country: "South Korea", city: "Seoul"},
{country: "South Sudan", city: "Juba"},
{country: "Spain", city: "Madrid"},
{country: "Sri Lanka", city: "Colombo"},
{country: "Sudan", city: "Khartum"},
{country: "Suriname", city: "Paramaribo"},
{country: "Swaziland", city: "Mbabane"},
{country: "Sweden", city: "Stockholm"},
{country: "Switzerland", city: "Bern"},
{country: "Syria", city: "Damascus"},
{country: "Taiwan", city: "Taipei"},
{country: "Tajikistan", city: "Dushanbe"},
{country: "Tanzania", city: "Dodoma"},
{country: "Thailand", city: "Bangkok"},
{country: "Togo", city: "Lom"},
{country: "Tokelau", city: "Fakaofo"},
{country: "Tonga", city: "Nuku'alofa"},
{country: "Trinidad and Tobago", city: "Port-of-Spain"},
{country: "Tunisia", city: "Tunis"},
{country: "Turkey", city: "Ankara"},
{country: "Turkmenistan", city: "Ashgabat"},
{country: "Turks and Caicos Islands", city: "Cockburn Town"},
{country: "Tuvalu", city: "Funafuti"},
{country: "Uganda", city: "Kampala"},
{country: "Ukraine", city: "Kyiv"},
{country: "United Arab Emirates", city: "Abu Dhabi"},
{country: "United Kingdom", city: "London"},
{country: "United States", city: "Washington"},
{country: "Uruguay", city: "Montevideo"},
{country: "Uzbekistan", city: "Toskent"},
{country: "Vanuatu", city: "Port-Vila"},
{country: "Venezuela", city: "Caracas"},
{country: "Vietnam", city: "Hanoi"},
{country: "Virgin Islands, British", city: "Road Town"},
{country: "Virgin Islands, U.S.", city: "Charlotte Amalie"},
{country: "Yemen", city: "Sanaa"},
{country: "Zambia", city: "Lusaka"},
{country: "Zimbabwe", city: "Harare"}
]

url = 'https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json'
airport_codes_serialized = open(url).read
airport_codes = JSON.parse(airport_codes_serialized)


array = []
x.each do |hash|
  array << hash[:city]
end

codes = []
countries = []
airport_codes.each do |hash|
  if array.include?(hash["city"])
    codes << hash["code"]
    countries << hash["country"]
  end
end
puts codes
puts countries.uniq
puts countries.uniq.count
puts codes.count

Ghana
Jordan
Argentina
Samoa
Turkmenistan
Eritrea
United Arab Emirates
Lebanon
Central African Republic
Barbados
Iraq
United Kingdom
Burundi
French Polynesia
Slovakia
Hungary
Brunei
Congo
Egypt
French Guiana
Australia
Guinea
Bangladesh
Syria
India
Indonesia
Qatar
Tajikistan
Cyprus
Namibia
Netherlands Antilles
Armenia
Democratic Republic of Congo
Sierra Leone
Kyrgyzstan
Tuvalu
Cayman Islands
Gibraltar
South Korea
Greenland
Azerbaijan
Vietnam
Solomon Islands
New Zealand
Japan
Zimbabwe
United States
Iran
Nauru
Sudan
Afghanistan
Rwanda
Jamaica
Moldova
Nepal
Angola
Mexico
Malaysia
Gabon
Slovenia
Bolivia
Zambia
Spain
Monaco
Somalia
Belarus
Maldives
Liberia
Mozambique
Lesotho
Uruguay
Bahamas
Kenya
Niger
Mauritania
Norfolk Island
France
Burkina Faso
Guinea-Bissau
Cambodia
Federated States of Micronesia
Papua New Guinea
Cape Verde
Morocco
Palau
Norway
Saudi Arabia
Seychelles
Singapore
Saint Kitts and Nevis
Macedonia
Bulgaria
Equatorial Guinea
Saint Vincent and the Grenadines
Georgia
Tonga
Honduras
Germany
Libyan Arab Jamahiriya
Estonia
Sao Tome and Principe
Tunisia
Ecuador
Mongolia
Vanuatu
Lithuania
Laos
Canada
Sweden
Comoros
Denmark
Netherlands

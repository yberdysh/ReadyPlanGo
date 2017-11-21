require 'json'

# Country.destroy_all

# COUNTRIES = {
#     "Africa" => [
#       {country: "Algeria", currency_name: "Algerian Dinar", capital: "Alger", code: "ALG"},
#       {country: "Angola", currency_name: "Angolan Kwanza", capital: "Luanda", code: "LAD"},
#       {country: "Benin", currency_name: "CFA Franc BCEAO", capital: "Porto-Novo", code: "BNI"},
#       {country: "Botswana", currency_name: "Botswana Pula", capital: "Gaborone", code: "FRW"},
#       {country: "Burkina Faso", currency_name: "CFA Franc BCEAO", capital: "Ouagadougou", code: "OUA"},
#       {country: "Burundi", currency_name: "Burundi Franc", capital: "Bujumbura", code: "BJM"},
#       {country: "Cameroon", currency_name: "CFA Franc BEAC", capital: "Yaound", code: "DLA"},
#       {country: "Cape Verde", currency_name: "Cape Verde Escudo", capital: "Praia", code: "BVC"},
#       {country: "Chad", currency_name: "CFA FRANC BEAC", capital: "N'Djam", code: "NDJ"},
#       {country: "Central African Republic", currency_name: "CFA Franc BEAC", capital: "Bangui", code: "BGF"},
#       {country: "Comoros", currency_name: "Comoros Franc", capital: "Moroni", code: "HAH"},
#       {country: "Republic of Congo", currency_name: "CFA FRANC BEAC", capital: "Brazzaville", code: "BZV"},
#       {country: "The Democratic Republic of Congo", currency_name: "CFA FRANC BEAC", capital: "Kinshasa", code: "FIH"},
#       {country: "Ivory Coast", currency_name: "CFA Franc BCEAO", capital: "Yamoussoukro", code: "ABJ"},
#       {country: "Djibouti", currency_name: "Djibouti Franc", capital: "Djibouti", code: "JIB"},
#       {country: "Egypt", currency_name: "Egyptian Pound", capital: "Cairo", code: "CAI"},
#       {country: "Equatorial Guinea", currency_name: "CFA FRANC BEAC", capital: "Malabo", code: "SSG"},
#       {country: "Eritrea", currency_name: "Nakfa", capital: "Asmara", code: "ASM"},
#       {country: "Ethiopia", currency_name: "Birr", capital: "Addis Abeba", code: "ADD"},
#       {country: "Gabon", currency_name: "CFA FRANC BEAC", capital: "Libreville", code: "LBV"},
#       {country: "Gambia", currency_name: "Dalasi", capital: "Banjul", code: "BJL"},
#       {country: "Ghana", currency_name: "Cedi", capital: "Accra", code: "ACC"},
#       {country: "Guinea", currency_name: "Guinea Franc", capital: "Conakry", code: "CKY"},
#       {country: "Guinea-Bissau", currency_name: "Guinea Bissau Peso", capital: "Bissau", code:"OXB"},
#       {country: "Kenya", currency_name: "Shilling", capital: "Nairobi", code: "NBO"},
#       {country: "Lesotho", currency_name: "Loti", capital: "Maseru", code: "MSU"},
#       {country: "Liberia", currency_name: "Liberian Dollar", capital: "Monrovia", code: "ROB"},
#       {country: "Libya", currency_name: "Libyan Dinar", capital: "Tripoli", code: "TIP"},
#       {country: "Madagascar", currency_name: "Malagasy Franc", capital: "Antananarivo", code: "TNR"},
#       {country: "Malawi", currency_name: "Malawi Kwacha", capital: "Lilongwe", code: "LLW"},
#       {country: "Mali", currency_name: "CFA FRANC BEAC", capital: "Bamako", code: "BKO"},
#       {country: "Mauritania", currency_name: "Ouguiya", capital: "Nouakchott", code: "NDB"},
#       {country: "Mauritius", currency_name: "Rupee", capital: "Port-Louis", code: "MRU"},
#       {country: "Morocco", currency_name: "Dirham", capital: "Rabat", code: "CMN"},
#       {country: "Mozambique", currency_name: "Metical", capital: "Maputo", code: "MPM"},
#       {country: "Namibia", currency_name: "Namibian Dollar", capital: "Windhoek", code: "WDH"},
#       {country: "Niger", currency_name: "CFA FRANC BEAC", capital: "Niamey", code: "NIM"},
#       {country: "Nigeria", currency_name: "Naira", capital: "Abuja", code: "LOS"},
#       {country: "Rwanda", currency_name: "Rawanda Franc", capital: "Kigali", code: "KGL"},
#       {country: "Sao Tome and Principe", currency_name: "Dobra", capital: "Sao Tome", code: "TMS"},
#       {country: "Senegal", currency_name: "CFA FRANC BEAC", capital: "Dakar", code: "DKR"},
#       {country: "Seychelles", currency_name: "Seychelle Rupee", capital: "Victoria", code: "SEZ"},
#       {country: "Sierra Leone", currency_name: "Leone", capital: "Freetown", code: "FNA"},
#       {country: "Somalia", currency_name: "Somalia Shilling", capital: "Mogadishu", code: "MGQ"},
#       {country: "South Africa", currency_name: "Rand", capital: "Pretoria", code: "CPT"},
#       {country: "South Sudan", currency_name: "South Sudanese Pound", capital: "Juba", code: "JUB"},
#       {country: "Sudan", currency_name: "Sudanese Pound", capital: "Khartum", code: "KRT"},
#       {country: "Swaziland", currency_name: "Lilangeni", capital: "Mbabane", code: "SHO"},
#       {country: "Tanzania", currency_name: "Tanzanian Shilling", capital: "Dodoma", code: "DAR"},
#       {country: "Togo", currency_name: "CFA FRANC BEAC", capital: "Lom", code: "LFW" },
#       {country: "Tunisia", currency_name: "Tunisiann Dollar", capital: "Tunis", code: "TUN"},
#       {country: "Uganda", currency_name: "Ugandan Shilling", capital: "Kampala", code: "EBB"},
#       {country: "Western Sahara", currency_name: "Morrocan Dinar", capital: "El-Aaiún", code: "VIL"},
#       {country: "Zambia", currency_name: "Zambian Kwacha", capital: "Lusaka", code: "LUN"},
#       {country: "Zimbabwe", currency_name: "Zimbabwe Dollar", capital: "Harare", code: "HRE"}
#     ],
#    "Asia" => [
#       {country: "Afghanistan", currency_name: "Afghanistan Afghani", capital: "Kabul", code:"KBL"},
#       {country: "Armenia", currency_name: "Armenian Dram", capital: "Yerevan", code: "EVN"},
#       {country: "Azerbaijan", currency_name: "Manat", capital: "Baku", code: "GYD"},
#       {country: "Bahrain", currency_name: "Bahraini Dinar", capital: "al-Manama", code: "BAH"},
#       {country: "Bangladesh", currency_name: "Bangladeshi Taka", capital: "Dhaka", code: "DAC"},
#       {country: "Bhutan", currency_name: "Bhutan Ngultrum", capital: "Thimphu", code: "PBH"},
#       {country: "Brunei", currency_name: "Brunei Dollar", capital: "Bandar Seri Begawan", code: "BWN"},
#       {country: "Cambodia", currency_name: "Kampuchean Riel", capital: "Phnom Penh", code: "PNH"},
#       {country: "China", currency_name: "Yuan", capital: "Beijing", code: "PEK"},
#       {country: "East Timor", currency_name: "US Dollar", capital: "Dili", code: "DIL"},
#       {country: "Georgia", currency_name: "Lari", capital: "Tbilisi", code: "TBS"},
#       {country: "India", currency_name: "Rupee", capital: "New Delhi", code: "DEL"},
#       {country: "Indonesia", currency_name: "Rupiah", capital: "Jakarta", code: "CGK"},
#       {country: "Iran", currency_name: "Iranian Rial", capital: "Tehran", code: "IKA"},
#       {country: "Iraq", currency_name: "Iraqi Dinar", capital: "Baghdad", code: "SDA"},
#       {country: "Israel", currency_name: "New Shekel", capital: "Jerusalem", code: "TLV"},
#       {country: "Japan", currency_name: "Yen", capital: "Tokyo", code: "FUK"},
#       {country: "Jordan", currency_name: "Jordanian Dinar", capital: "Amman", code: "AMM"},
#       {country: "Kazakstan", currency_name: "Tenge", capital: "Astana", code: "TSE"},
#       {country: "Kuwait", currency_name: "Kuwaiti Dinar", capital: "Kuwait", code: "KWI"},
#       {country: "Kyrgyzstan", currency_name: "Som", capital: "Bishkek", code: "FRU"},
#       {country: "Laos", currency_name: "Kip", capital: "Vientiane", code: "VTE"},
#       {country: "Lebanon", currency_name: "Lebanonese Pound", capital: "Beirut", code: "BEY"},
#       {country: "Macao", currency_name: "Pataca", capital: "Macao", code: "MFM"},
#       {country: "Malaysia", currency_name: "Ringgit", capital: "Kuala Lumpur", code: "KUL"},
#       {country: "Maldives", currency_name: "Rufiyaa", capital: "Male", code: "MLE"},
#       {country: "Mongolia", currency_name: "Tugrik", capital: "Ulan Bator", code: "ULN"},
#       {country: "Myanmar", currency_name: "Kyat", capital: "Rangoon", code: "RGN"},
#       {country: "Nepal", currency_name: "Nepalese Rupee", capital: "Kathmandu", code: "KTM"},
#       {country: "North Korea", currency_name: "North Korean Won", capital: "Pyonyang", code: ""},
#       {country: "Oman", currency_name: "Omani Rial", capital: "Masqat", code: "MCT"},
#       {country: "Pakistan", currency_name: "Pakistan Rupee", capital: "Islamabad", code: "KHI"},
#       {country: "Philippines", currency_name: "Philippine Peso", capital: "Manila", code: "MNL"},
#       {country: "Qatar", currency_name: "Qatari Rial", capital: "Doha", code: "DOH"},
#       {country: "Saudi Arabia", currency_name: "Saudi Rial", capital: "Riyadh", code: "JED"},
#       {country: "Singapore", currency_name: "Singapore Dollar", capital: "Singapore", code: "SIN"},
#       {country: "South Korea", currency_name: "Korean Won", capital: "Seoul", code: "ICN"},
#       {country: "Sri Lanka", currency_name: "Sri Lanka Rupee", capital: "Colombo", code: "CMB"},
#       {country: "Syria", currency_name: "Syrian Pound", capital: "Damascus", code: "DAM"},
#       {country: "Taiwan", currency_name: "Taiwan Dollar", capital: "Taipei", code: "TPE"},
#       {country: "Tajikistan", currency_name: "Somoni", capital: "Dushanbe", code: "DYU"},
#       {country: "Thailand", currency_name: "Bhaht", capital: "Bangkok", code: "BKK"},
#       {country: "Turkey", currency_name: "Lira", capital: "Ankara", code: "IST"},
#       {country: "Turkmenistan", currency_name: "Manat", capital: "Ashgabat", code: "ASB"},
#       {country: "United Arab Emirates", currency_name: "Dirham", capital: "Abu Dhabi", code: "AUH"},
#       {country: "Uzbekistan", currency_name: "Sum", capital: "Toskent", code: "TAS"},
#       {country: "Vietnam", currency_name: "Dong", capital: "Hanoi", code: "SGN"},
#       {country: "Yemen", currency_name: "Yemeni Rial", capital: "Sanaa", code: "SAH"}
#     ],
#      "Europe" => [
#       {country: "Albania", currency_name: "Albanian Lek", capital: "Tirana", code: "TIA"},
#       {country: "Andorra", currency_name: "Euro", capital: "Andorra la Vella", code: "LEU"},
#       {country: "Austria", currency_name: "Euro", capital: "Wien", code: "VIE"},
#       {country: "Belarus", currency_name: "Belarussian Ruble", capital: "Minsk", code: "MSQ"},
#       {country: "Belgium", currency_name: "Euro", capital: "Brussels", code: "BRU"},
#       {country: "Bosnia and Herzegovina", currency_name: "Marka", capital: "Sarajevo", code: "SJJ"},
#       {country: "Bulgaria", currency_name: "Bulgarian Lev", capital: "Sofia", code: "SOF"},
#       {country: "Croatia", currency_name: "Kuna", capital: "Zagreb", code: "SPU"},
#       {country: "Cyprus", currency_name: "Euro", capital: "Nicosia", code: "LCA"},
#       {country: "Czech Republic", currency_name: "Koruna", capital: "Prauge", code: "PRG"},
#       {country: "Denmark", currency_name: "Danish Krone", capital: "Copenhagen", code: "CPH"},
#       {country: "England", currency_name: "Pound", capital: "London", code: "LHR"},
#       {country: "Estonia", currency_name: "Euro", capital: "Tallinn", code: "TLL"},
#       {country: "Finland", currency_name: "Euro", capital: "Helsinki", code: "HEL"},
#       {country: "France", currency_name: "Euro", capital: "Paris", code: "CDG"},
#       {country: "Germany", currency_name: "Euro", capital: "Berlin", code: "TXL"},
#       {country: "Gibraltar", currency_name: "Gibraltar Pound", capital: "Gibraltar", code: "GIB"},
#       {country: "Greece", currency_name: "Euro", capital: "Athens", code: "ATH"},
#       {country: "Hungary", currency_name: "Forint", capital: "Budapest", code: "BUD"},
#       {country: "Iceland", currency_name: "Iceland Krona", capital: "Reykjav", code: "RKV"},
#       {country: "Ireland", currency_name: "Ireland", capital: "Dublin", code: "DUB"},
#       {country: "Italy", currency_name: "Euro", capital: "Roma", code: "FCO"},
#       {country: "Latvia", currency_name: "Euro", capital: "Riga", code: "RIX"},
#       {country: "Liechtenstein", currency_name: "Swiss Franc", capital: "Vaduz", code: "ACH"},
#       {country: "Lithuania", currency_name: "Euro", capital: "Vilnius", code: "VNO"},
#       {country: "Luxembourg", currency_name: "Euro", capital: "Luxembourg", code: "LUX"},
#       {country: "Macedonia", currency_name: "Denar", capital: "Skopje", code: "SKG"},
#       {country: "Malta", currency_name: "Euro", capital: "Valletta", code: "MLA"},
#       {country: "Martinique", currency_name: "Euro", capital: "Fort-de-France", code: "FDF"},
#       {country: "Moldova", currency_name: "Moldovan Leu", capital: "Chisinau", code: "KIV"},
#       {country: "Monaco", currency_name: "Euro", capital: "Monaco-Ville", code: "NCE"},
#       {country: "Montenegro", currency_name: "Euro", capital: "Podgorica", code: "TGD"},
#       {country: "Netherlands", currency_name: "Euro", capital: "Amsterdam", code: "AMS"},
#       {country: "Northern Ireland", currency_name: "Pound", capital: "Belfast", code: "BFS"},
#       {country: "Norway", currency_name: "Euro", capital: "Oslo", code: "OSL"},
#       {country: "Poland", currency_name: "Zloty", capital: "Warszawa", code: "WAW"},
#       {country: "Portugal", currency_name: "Euro", capital: "Lisboa", code: "LIS"},
#       {country: "Romania", currency_name: "Romanian Leu", capital: "Bucharest", code: "OTP"},
#       {country: "Russia", currency_name: "Ruble", capital: "Moscow", code: "SVO"},
#       {country: "San Marino", currency_name: "Euro", capital: "San Marino", code: "RMI"},
#       {country: "Scotland", currency_name: "Pound", capital: "Edinburgh", code: "EDI"},
#       {country: "Serbia", currency_name: "Serbian Dinar", capital: "Belgrade", code: "BEG"},
#       {country: "Slovakia", currency_name: "Euro", capital: "Bratislava", code: "BTS"},
#       {country: "Slovenia", currency_name: "Euro", capital: "Ljubljana", code: "LJU"},
#       {country: "Spain", currency_name: "Euro", capital: "Madrid", code: "MAD"},
#       {country: "Sweden", currency_name: "Swedish Krona", capital: "Stockholm", code: "ARN"},
#       {country: "Switzerland", currency_name: "Euro", capital: "Bern", code: "ZRH"},
#       {country: "Ukraine", currency_name: "Hryvnia", capital: "Kyiv", code: "KBP"},
#       {country: "United Kingdom", currency_name: "Pound", capital: "London", code: "LHR"}
#     ],
#     "North America" => [
#      {country: "Canada", currency_name: "Canadian Dollar", capital: "Ottawa", code: "YYZ"},
#      {country: "Greenland", currency_name: "Danish Krone", capital: "Nuuk", code: "GOH"},
#      {country: "United States", currency_name: "US Dollar", capital: "Washington", code: "JFK"},
#      {country: "Mexico", currency_name: "Mexican Peso", capital: "Mexico City", code: "MEX"}
#     ],
#     "Central America" => [
#       {country: "Anguilla", currency_name: "East Caribbean Dollar", capital: "The Valley", code: "AXA"},
#       {country: "Antigua and Barbuda", currency_name: "East Caribbean Dollar", capital: "Saint John's", code: "ANU"},
#       {country: "Aruba", currency_name: "Aruban Guilder", capital: "Oranjestad", code: "AUA"},
#       {country: "Bahamas", currency_name: "Bahamian Dollar", capital: "Nassau", code: "FPO"},
#       {country: "Barbados", currency_name: "Barbados Dollar", capital: "Bridgetown", code: "BGI"},
#       {country: "Belize", currency_name: "Belize Dollar", capital: "Belmopan", code: "BDA"},
#       {country: "Bermuda", currency_name: "Bermudian Dollar", capital: "Hamilton", code: "BDA"},
#       {country: "Cuba", currency_name: "Cuban Peso", capital: "Havana", code: "BZE"},
#       {country: "Curacao", currency_name: "Netherlands Antillean Guilder", capital: "Willemstad", code: "CUR"},
#       {country: "Costa Rica", currency_name: "Costa Rican Colón", capital: "San Jose", code: "SJO"},
#       {country: "Dominica", currency_name: "Eastern Caribbean Dollar", capital: "Roseau", code: "DOM"},
#       {country: "Dominican Republic", currency_name: "Dominican Peso", capital: "Santo Domingo de Guzm", code: "PUJ"},
#       {country: "El Salvador", currency_name: "US Dollar", capital: "San Salvador", code: "SAL"},
#       {country: "Grenada", currency_name: "Eastern Caribbean Dollar", capital: "Saint George's", code: "GND"},
#       {country: "Guatemala", currency_name: "Quetzal", capital: "Ciudad de Guatemala", code: "GUA"},
#       {country: "Haiti", currency_name: "Gourde", capital: "Port-au-Prince", code: "PAP"},
#       {country: "Honduras", currency_name: "Lempira", capital: "Tegucigalpa", code: "TGU"},
#       {country: "Jamaica", currency_name: "Jamaican Dollar", capital: "Kingston", code: "KIN"},
#       {country: "Nicaragua", currency_name: "Córdoba", capital: "Managua", code: "MGA"},
#       {country: "Panama", currency_name: "Balboa", capital: "Panama City", code: "PTY"},
#       {country: "Puerto Rico", currency_name: "US Dollar", capital: "San Juan", code: "SJU"},
#       {country: "Saint Kitts and Nevis", currency_name: "Eastern Caribbean Dollar", capital: "Basseterre", code: "SKB"},
#       {country: "Saint Lucia", currency_name: "Eastern Caribbean Dollar", capital: "Castries", code: "UVF"},
#       {country: "Saint Vincent and the Grenadines", currency_name: "Eastern Caribbean Dollar", capital: "Kingstown", code: "SVD"},
#       {country: "Trinidad and Tobago", currency_name: "Trinidad and Tobago Dollar", capital: "Port-of-Spain", code: "POS"},
#       {country: "Turks and Caicos Islands", currency_name: "US Dollar", capital: "Cockburn Town", code: "PLS"},
#       {country: "British Virgin Islands", currency_name: "US Dollar", capital: "Road Town", code: "EIS"},
#       {country: "US Virgin Islands", currency_name: "US Dollar", capital: "Charlotte Amalie", code: "STT "}
#     ],
#       "South America" => [
#       {country: "Argentina", currency_name: "Argentine Peso", capital: "Buenos Aires", code: "EZE"},
#       {country: "Bolivia", currency_name: "Boliviano", capital: "La Paz", code: "LPB"},
#       {country: "Brazil", currency_name: "Brazilian Real", capital: "Brasília", code: "GRU"},
#       {country: "Chile", currency_name: "Chilean Peso", capital: "Santiago", code: "SCL"},
#       {country: "Colombia", currency_name: "Columbian Peso", capital: "Bogota", code: "BOG"},
#       {country: "Ecuador", currency_name: "US Dollar", capital: "Quito", code: "UIO"},
#       {country: "Guyana", currency_name: "Guyanese Dollar", capital: "Georgetown", code: "GEO"},
#       {country: "Paraguay", currency_name: "Guaraní", capital: "Asunci", code: "ASU"},
#       {country: "Peru", currency_name: "Sol", capital: "Lima", code: "LIM"},
#       {country: "Uruguay", currency_name: "Uruguayan Peso", capital: "Montevideo", code: "MVD"},
#       {country: "Venezuela", currency_name: "Bolivar", capital: "Caracas", code: "CCS"}
#   ],
#      "Oceania" => [
#       {country: "Australia", currency_name: "Australian Dollar", capital: "Canberra", code: "SYD"},
#       {country: "Fiji", currency_name: "Fijian Dollar", capital: "Suva", code: "NAM"},
#       {country: "French Polynesia", currency_name: "CFP Franc", capital: "Papeete", code: "PPT"},
#       {country: "Guam", currency_name: "US Dollar", capital: "Aga", code: "GUM"},
#       {country: "Kiribati", currency_name: "Kiribati Dollar", capital: "South Tarawa", code: "TRW"},
#       {country: "Federated States of Micronesia", currency_name: "US Dollar", capital: "Palikir", code: "PNI"},
#       {country: "Nauru", currency_name: "Australian Dollar", capital: "Yaren", code: "INU"},
#       {country: "New Caledonia", currency_name: "CFP Franc", capital: "Noum", code: "NOU"},
#       {country: "New Zealand", currency_name: "New Zealand Dollar", capital: "Wellington", code: "AKF"},
#       {country: "Niue", currency_name: "New Zealand Dollar", capital: "Alofi", code: "IUE"},
#       {country: "Palau", currency_name: "US Dollar", capital: "Koror", code: "ROR"},
#       {country: "Papua New Guinea", currency_name: "Kina", capital: "Port Moresby", code: "POM"},
#       {country: "Samoa", currency_name: "Tala", capital: "Apia", code: "APW"},
#       {country: "Solomon Islands", currency_name: "Solomon Islands Dollar", capital: "Honiara", code: "HIR"},
#       {country: "Suriname", currency_name: "Surinamese Dollar", capital: "Paramaribo", code: "PBM"},
#       {country: "Tokelau", currency_name: "New Zealand Dollar", capital: "Fakaofo", code: "APW"},
#       {country: "Tonga", currency_name: "Paʻanga", capital: "Nuku'alofa", code: "TBU"},
#       {country: "Tuvalu", currency_name: "Tuvaluan Dollar", capital: "Funafuti", code: "FUN"},
#       {country: "Vanuatu", currency_name: "Vatu", capital: "Port-Vila", code: "VLI"}
#     ]
#   }


#   COUNTRIES.each_pair do |continent, countries|
#     countries.each do |country|
#        Country.create(
#         name: country[:country],
#         continent: continent.to_s,
#         currency_name: country[:currency_name],
#         capital: country[:capital],
#         airport_code: country[:airport_code])
#     end
#   end

# attributes = [
#   {
#     attribute_name: 'abbreviation',
#     file: 'db/country-json/country-by-abbreviation.json',
#     json_name: 'abbreviation'
#   },
#   {
#     attribute_name: 'avg_male_height',
#     file: 'db/country-json/country-by-avg-male-height.json',
#     json_name: 'height'
#   },
#   {
#     attribute_name: 'calling_code',
#     file: 'db/country-json/country-by-calling-code.json',
#     json_name: 'calling_code'
#   },
#   {
#     attribute_name: 'capital_city',
#     file: 'db/country-json/country-by-capital-city.json',
#     json_name: 'city'
#   },
#   {
#     attribute_name: 'currency_code',
#     file: 'db/country-json/country-by-currency-code.json',
#     json_name: 'currency_code'
#   },
#   {
#     attribute_name: 'elevation',
#     file: 'db/country-json/country-by-elevation.json',
#     json_name: 'elevation'
#   },
#   {
#     attribute_name: 'flag',
#     file: 'db/country-json/country-by-flag.json',
#     json_name: 'flag_base64'
#   },
#   {
#     attribute_name: 'government_type',
#     file: 'db/country-json/country-by-government-type.json',
#     json_name: 'government'
#   },
#   {
#     attribute_name: 'independence_date',
#     file: 'db/country-json/country-by-independence-date.json',
#     json_name: 'independence'
#   },
#   {
#     attribute_name: 'iso',
#     file: 'db/country-json/country-by-iso-numeric.json',
#     json_name: 'iso'
#   },
#   {
#     attribute_name: 'landlocked',
#     file: 'db/country-json/country-by-landlocked.json',
#     json_name: 'landlocked'
#   },
#   {
#     attribute_name: 'life_expectancy',
#     file: 'db/country-json/country-by-life-expectancy.json',
#     json_name: 'expectancy'
#   },
#   {
#     attribute_name: 'national_dish',
#     file: 'db/country-json/country-by-national-dish.json',
#     json_name: 'dish'
#   },
#   {
#     attribute_name: 'population_density',
#     file: 'db/country-json/country-by-population-density.json',
#     json_name: 'density'
#   },
#   {
#     attribute_name: 'population',
#     file: 'db/country-json/country-by-population.json',
#     json_name: 'population'
#   },
#   {
#     attribute_name: 'avg_temperature_in_celsius',
#     file: 'db/country-json/country-by-yearly-average-temperature.json',
#     json_name: 'temperature'
#   },
#   ]

#   attributes.each do |attribute|
#     puts "Setting #{attribute[:attribute_name]}"
#     Country.set_attribute_from_json(attribute[:file], attribute[:attribute_name], attribute[:json_name])
#     count = Country.where.not(attribute[:attribute_name].to_sym => nil).count
#     puts "Set #{attribute[:attribute_name]} for #{count} countries."
#   end

# Language.destroy_all

# language_file = File.read('db/country-json/country-by-languages.json')
# language_json = JSON.parse(language_file, opts = {symbolize_names: true})
# language_json.each do |item|
#   language = Language.new(name: item[:language])
#   language.country = Country.find_by(name: item[:country])
#   unless language.country.nil?
#     language.save!
#   end
# end

countries = Country.all

countries.each do |country|
  if country.photo.url.nil?
    image_url = Unsplash::Photo.search(country.name, page = 1, per_page = 1).first.urls.full
    unless image_url.nil?
      country.remote_photo_url = image_url
      country.save!
    end
  end
end






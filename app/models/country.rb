class Country < ApplicationRecord
  has_many :destinations
  geocoded_by :name

  CONTINENTS = [
    "Africa",
    "Asia",
    "Europe",
    "North America",
    "Central America",
    "South America",
    "Oceania"
  ]

end

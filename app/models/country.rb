class Country < ApplicationRecord
  has_many :destinations
  geocoded_by :name
  after_validation :geocode, if: :name_changed?

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

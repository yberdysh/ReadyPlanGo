class Destination < ApplicationRecord
  belongs_to :country
  validates :country_id, uniqueness: true
  DESTINATION_TYPES = [
    {
      title: "Countries I've Been to",
      status: 1,
      id: "visited"
    },
    {
      title: "Countries I want to visit",
      status: 2,
      id: "tovisit"
    },
    {
      title: "High Priority",
      status: 3,
      id: "visitsoon"
    }
  ]
end

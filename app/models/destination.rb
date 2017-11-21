class Destination < ApplicationRecord
  belongs_to :country
  validates :country_id, uniqueness: true
  DESTINATION_TYPES = [
    {
      # title: "<i class="fa fa-star-o" aria-hidden="true"></i><p>Countries I've Visited</p>".html_safe,
      title: "Countries I've Been to",
      status: 1,
      id: "visited"
    },
    {
      title: "Countries I want to visit",
      status: 2,
      id: "toVisit"
    },
    {
      title: "High Priority",
      status: 3,
      id: "visitSoon"
    }
  ]
end

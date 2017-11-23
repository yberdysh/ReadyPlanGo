class Destination < ApplicationRecord
  belongs_to :country
  validates :country_id, uniqueness: true
  DESTINATION_TYPES = [
    {
      # title: "<i class="fa fa-star-o" aria-hidden="true"></i><p>Countries I've Visited</p>".html_safe,
      title: "Countries I've Been To",
      status: 1,
      id: "visited",
      icon: '<i class="fa fa-star-o" aria-hidden="true"></i>'
    },
    {
      title: "Countries I Want to Visit",
      status: 2,
      id: "toVisit",
      icon: '<i class="fa fa-plus-circle" aria-hidden="true"></i>'
    },
    {
      title: "Top Priority",
      status: 3,
      id: "visitSoon",
      icon: '<i class="fa fa-check-circle-o" aria-hidden="true"></i>'
    }
  ]
end

class Destination < ApplicationRecord
  belongs_to :country
  validates :country_id, uniqueness: true
  DESTINATION_TYPES = [
    {
      # title: "<i class="fa fa-star-o" aria-hidden="true"></i><p>Countries I've Visited</p>".html_safe,
      title: "Countries I've Visited",
      status: 1
    },
    {
      title: "Countries I Want to Visit",
      status: 2
    },
    {
      title: "Top Priority",
      status: 3
    }
  ]
end

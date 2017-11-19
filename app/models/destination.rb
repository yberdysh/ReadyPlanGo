class Destination < ApplicationRecord
  belongs_to :country

  DESTINATION_TYPES = [
    {
      title: "Countries I've Been to",
      status: 1
    },
    {
      title: "Countries I want to visit",
      status: 2
    },
    {
      title: "High Priority",
      status: 3
    }
  ]

  # def has_been
  #   self.status == 1 ? true : false
  # end

  # def priority
  #   self.status == 3 ? true : false
  # end

end

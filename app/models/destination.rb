class Destination < ApplicationRecord
  belongs_to :country

  DESTINATION_TYPES = [
    {
      title: "Countries I've Been to",
      has_been: true,
      priority: false,
      status: 1
    },
    {
      title: "Countries I want to visit",
      has_been: false,
      priority: false,
      status: 2
    },
    {
      title: "High Priority",
      has_been: false,
      priority: true,
      status: 3
    }
  ]

  def has_been
    self.status == 1 ? true : false
  end

  def priority
    self.status == 3 ? true : false
  end

end

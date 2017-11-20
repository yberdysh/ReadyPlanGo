class Country < ApplicationRecord
  has_many :destinations
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
  has_many :reviews, dependent: :destroy

  def average_rating
    average_rating = 0
    if self.reviews.length > 0
      self.reviews.each do |review|
        average_rating += review.rating
      end
      average_rating = average_rating.to_f / self.reviews.length
    end
    return average_rating
  end


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

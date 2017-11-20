require 'json'

class Country < ApplicationRecord
  has_many :destinations
  has_many :languages
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

  def self.set_attribute_from_json(file, attribute_name, json_name)
    file = File.read(file)
    json = JSON.parse(file, opts = {symbolize_names: true})
    json.each do |item|
      country = Country.find_by(name: item[:country])
      # byebug if attribute_name == "avg_male_height"
      unless country.nil?
        if Country.columns_hash[attribute_name].type == "float".to_sym
          country[attribute_name.to_sym] = item[json_name.to_sym].to_f
        elsif Country.columns_hash[attribute_name].type == "integer".to_sym
          country[attribute_name.to_sym] = item[json_name.to_sym].to_i
        elsif Country.columns_hash[attribute_name].type == "boolean".to_sym
          if item[json_name.to_sym].downcase == "yes" || item[json_name.to_sym].downcase == "true"
           country[attribute_name.to_sym] = true
          else
           country[attribute_name.to_sym] = false
          end
        else
          country[attribute_name.to_sym] = item[json_name.to_sym]
        end

        country.save!
      end
    end
  end

end

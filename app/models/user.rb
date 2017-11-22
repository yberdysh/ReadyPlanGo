class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :set_defaults, unless: :persisted?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :destinations
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  def set_defaults
    self.years  ||= 0
    self.number_countries ||= 0
  end

  def goal_progress_data
    goal = self.number_countries
    visited = self.destinations.where(status: 1).length

    dataSet = {
      labels: ["Goal", "Visited"],
      counts: [goal, visited]
    }
  end

  def continent_data
    destinations = self.destinations

    continents = []

    destinations.each do |destination|
      continents << destination.country.continent
    end

    continents = continents.each_with_object(Hash.new(0)){ |m,h| h[m] += 1 }.sort_by{ |k,v| v }
    continents.reverse

    dataSet = {
      labels: [],
      counts: []
    }

    continents.each do |continent|
      dataSet[:labels] << continent[0]
      dataSet[:counts] << continent[1]
    end


    return dataSet
  end

  def language_data
    destinations = self.destinations

    languages = []

    destinations.each do |destination|
      destination.country.languages.each do |language|
        languages << language.name
      end
    end

    languages = languages.each_with_object(Hash.new(0)){ |m,h| h[m] += 1 }.sort_by{ |k,v| v }
    languages.reverse

    dataSet = {
      labels: [],
      counts: []
    }

    languages.each do |language|
      dataSet[:labels] << language[0]
      dataSet[:counts] << language[1]
    end


    return dataSet
  end

  private

end



require 'open-uri'
require 'nokogiri'

class CountriesController < ApplicationController

  def index
    @countries = policy_scope(Country).where(name: "#{params[:query]}")
  end

  def show
    if (params[:id] =~ /\A[-+]?[0-9]+\z/)
      @country = Country.find(params[:id])
    else
      @country = Country.find_by_name(params[:id])
    end
    authorize @country
    scrape
    @hash = Gmaps4rails.build_markers(@country) do |country, marker|
      marker.lat country.latitude
      marker.lng country.longitude
      marker.json({ link: country_path(@country) })
    end
    @destination = @country.destinations.where(user_id: current_user.id)
  end

  private

  def set_departure
    case current_user.airport_code
      when "New York"
        "JFK"
      when "Amsterdam"
        "AMS"
      when "Los Angeles"
        "LAX"
      when "Rio De Janeiro"
        "GIG"
      when "Sydney"
        "SYD"
      when "Tokyo"
        "HND"
      when "Cairo"
        "CAI"
      when "Frankfurt"
        "FRA"
      when "Moscow"
        "DME"
      when "Atlanta"
        "ATL"
      when "Toronto"
        "YYZ"
      when "London"
        "YXU"
      when "New Dheli"
        "DEL"
      when "Dubai"
        "DXB"
      when "Shanghai"
        "PVG"
      when "Hong Kong"
        "HKG"
      when nil
        nil
      end
  end

  def scrape
    @slip = []
    destination_code = @country.airport_code
    departure_code = set_departure
    byebug
    unless departure_code.nil?
      url = "http://www.hopper.com/flights/from-#{departure_code}/to-#{destination_code}/guide"

      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      puts url
      html_doc.search('.legend-label').each do |element|
        @slip << element.text.strip
      end
    end
  end
end

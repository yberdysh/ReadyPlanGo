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
      when "Miami"
        "MIA"
      when "Newark"
        "EWR"
      when "San Francisco"
        "SFO"
      when "Houston"
        "IAH"
      when "Washington, DC"
        "IAD"
      when "Los Angeles"
        "LAX"
      when "Atlanta"
        "ATL"
      when "Dallas"
        "DFW"
      when "Toronto"
        "YYZ"
      when "Vancouver"
        "YVR"
      when "Montreal"
        "YUL"
      when "Amsterdam"
        "AMS"
      when "Paris"
        "CDG"
      when "Frankfurt"
        "FRA"
      when "Moscow"
        "DME"
      when "London"
        "LHR"
      when "Rome"
        "FCO"
      when "Vienna"
        "VIE"
      when "Helsinki"
        "HEL"
      when "Copenhagen"
        "CPH"
      when "Zurich"
        "ZRH"
      when "Sydney"
        "SYD"
      when "Tokyo"
        "HND"
      when "Cairo"
        "CAI"
      when "New Dheli"
        "DEL"
      when "Dubai"
        "DXB"
      when "Shanghai"
        "PVG"
      when "Hong Kong"
        "HKG"
      when "Beijing"
        "PKE"
      when "Seoul"
        "ICN"
      when "Jeddah"
        "JED"
      when "Sao Paulo"
        "GRU"
      when "Bogota"
        "BOG"
      when "Rio De Janeiro"
        "GIG"
      when "Santiago"
        "SCL"
      when "Lima"
        "LIM"
      when "Caracas"
        "CCS"
      when "Buenos Aires"
        "AEP"
      when "Quito"
        "UIO"
      when "Medellin"
        "MDE"
      when "Panama City"
        "PTY"
      when nil
        nil
      end
  end

  def scrape
    @slip = []
    destination_code = @country.airport_code
    departure_code = set_departure

    unless departure_code.nil?
      url = "http://www.hopper.com/flights/from-#{departure_code}/to-#{destination_code}/guide"
      @url = url
      begin
        html_file = open(url).read
        html_doc = Nokogiri::HTML(html_file)
        puts url
        html_doc.search('.legend-label').each do |element|
          @slip << element.text.strip
        end
      rescue
        puts "Failed to find this url"
      end
    end
  end
end

class CountriesController < ApplicationController
  def show
    if  (params[:id] =~ /\A[-+]?[0-9]+\z/)
      @country = Country.find(params[:id])
    else
      @country = Country.find_by_name(params[:id])
    end
    authorize @country

    @hash = Gmaps4rails.build_markers(@country) do |country, marker|
      marker.lat country.latitude
      marker.lng country.longitude
    end
  end
end

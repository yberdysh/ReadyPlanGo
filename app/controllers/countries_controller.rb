class CountriesController < ApplicationController
  def show
    if  (params[:id] =~ /\A[-+]?[0-9]+\z/)
      @country = Country.find(params[:id])
    else
      @country = Country.find_by_name(params[:id])
    end
    authorize @country
  end
end

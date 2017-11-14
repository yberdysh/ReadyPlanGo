class CountriesController < ApplicationController
  def show
    @country = Country.find_by_name(params[:id])
  end
end

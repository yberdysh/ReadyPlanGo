class CountriesController < ApplicationController
  def show
    @country = Country.find_by name: params[:id]
  end
end

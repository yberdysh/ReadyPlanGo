class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def destination_select
    @countries = Country.all
    @destinations = Destination.where(user: current_user)
    authorize @countries
    authorize @destinations
  end

end

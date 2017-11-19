class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_user.nil?
      @user = User.new
    elsif current_user.destinations.empty?
      redirect_to destination_select_path
    else
      redirect_to user_path(current_user)
    end
  end

  def destination_select
    @countries = Country.all
    @destinations = current_user.destinations
  end
  def map
    @countries = Country.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@countries) do |country, marker|
      marker.lat country.latitude
      marker.lng country.longitude
    end
  end
end

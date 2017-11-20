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
    @destinations = current_user.destinations
    @hash = Gmaps4rails.build_markers(@destinations) do |destination, marker|
      if destination.status == 1
       marker.picture({
        url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|007FFF|000000",
        width: 50,
        height: 32
       })
      elsif destination.status == 2
       marker.picture({
        url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|F7FF12|000000",
        width: 50,
        height: 32
       })
      elsif destination.status == 3
        marker.picture({
        url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FF2B0A|000000",
        width: 50,
        height: 32
       })
      end
      marker.lat destination.country.latitude
      marker.lng destination.country.longitude
    end
  end
end

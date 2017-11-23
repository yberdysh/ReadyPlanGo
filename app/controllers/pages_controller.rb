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
    @destinations = current_user.destinations

    @countries = Country.all
  end
  def map
    @destinations = current_user.destinations
    @hash = Gmaps4rails.build_markers(@destinations) do |destination, marker|
      if destination.status == 1
       marker.picture({
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511448278/u5qfd75rbk4a00jixh0w.png",
        width: 50,
        height: 32
       })
       # marker.description "Visited"
      elsif destination.status == 2
       marker.picture({
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511448235/vknyv4kmmvq5d0w2vnc8.png",
        width: 50,
        height: 32
       })
        # marker.description "To Visit"
      elsif destination.status == 3
        marker.picture({
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511448291/dfrmxko5k1lnpugl3zul.png",
        width: 50,
        height: 32
       })
        # marker.description "Visit Soon"
      end
      marker.lat destination.country.latitude
      marker.lng destination.country.longitude
      # marker.json({ link: country_url(destination.country) })
      marker.title destination.to_json
    end
  end
end

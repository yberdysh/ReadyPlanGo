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
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511388468/m2rlmgnvwwbhiykle6pw.png",
        width: 50,
        height: 32
       })
      elsif destination.status == 2
       marker.picture({
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511388438/qszlulh1sntb0xz06gkl.png",
        width: 50,
        height: 32
       })
      elsif destination.status == 3
        marker.picture({
        url: "http://res.cloudinary.com/ddsp5wihh/image/upload/v1511388483/bxy5l1pnf1bjlvu2fcvh.png",
        width: 50,
        height: 32
       })
      end
      marker.lat destination.country.latitude
      marker.lng destination.country.longitude
      # marker.json({ link: country_url(destination.country) })
      marker.title country_url(destination.country)
    end
  end
end

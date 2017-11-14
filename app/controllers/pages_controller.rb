class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @countries = Country.all
    @destinations = Destination.where(user: current_user)
  end

end

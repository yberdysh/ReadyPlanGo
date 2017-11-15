class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_user.nil?
      @user = User.new
    end
  end

  def destination_select
    @countries = Country.all
    @destinations = current_user.destinations
  end

end

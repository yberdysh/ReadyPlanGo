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

end

class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.country = Country.find(destination_params[:country_id])
    @destination.user_id = current_user.id
    authorize @destination
    @destination.save!
  end

  private

  def destination_params
    params[:destination][:priority] = params[:destination][:priority] == "true" ? true : false
    params[:destination][:has_been] = params[:destination][:has_been] == "true" ? true : false

    params.require(:destination).permit(:country_id, :priority, :has_been)
  end
end

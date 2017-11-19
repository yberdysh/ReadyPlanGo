class DestinationsController < ApplicationController
  before_action :set_destination, only: [:update, :destroy]
  def index
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new
    authorize @destination
    @destination.country = Country.find(destination_params[:country_id])
    @destination.status = destination_params[:status]
    @destination.user_id = current_user.id
    authorize @destination
    @destination.save!
    redirect_to destination_select_path
  end

  def update
    @destination.status = destination_params[:status]
    @destination.save!
    redirect_to destination_select_path
  end

  def destroy
    @destination.destroy
    redirect_to destination_select_path
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
    authorize @destination
  end
  def destination_params
    params.require(:destination).permit(:country_id, :status)
  end
end

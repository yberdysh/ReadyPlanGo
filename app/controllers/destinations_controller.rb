class DestinationsController < ApplicationController
  before_action :set_destination, only: [:update, :destroy]
  def index
    @destinations = Destination.all
  end

  def create
      @destination = Destination.new
      @destination.country = Country.find(destination_params[:country_id])
      @destination.status = destination_params[:status]
      @destination.user_id = current_user.id
      authorize @destination
      check_existence
      if @destination_check.empty?
        @destination.save!
      else
        redirect_to destination_select_path
      end
  end


  def update
    @destination.update(destination_params)
    @from_card = params[:destination][:h].to_i
    puts "========="
    p @destination
    p @from_card
  end

  def update_status
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
    params.require(:destination).permit(:country_id, :status, :notes)
  end
  def check_existence
    @destination_check = Destination.where(country_id: @destination.country_id)
  end
end

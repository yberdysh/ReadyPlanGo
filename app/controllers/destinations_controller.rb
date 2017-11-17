class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new
    @destination.country = Country.find(destination_params[:country_id])
    @destination.status = destination_params[:status]

    @destination.user_id = current_user.id
    authorize @destination
    @destination.save!
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.status = destination_params[:status]

    authorize @destination
    @destination.save!
    redirect_to destination_select_path
  end

  def destroy
    @destination = Destination.find(params[:id])
    authorize @destination
    @destination.destroy
    redirect_to destination_select_path
  end

  private

  def destination_params
    if params[:destination][:status].nil?
      unless params[:destination][:has_been].nil?
        has_been = params[:destination][:has_been]
      end
      has_been ||= @destination.has_been

      unless params[:destination][:priority].nil?
       priority = params[:destination][:priority]
      end
      priority ||= @destination.priority

      params[:destination][:status] = calc_status(priority, has_been)
    end
    # # If priority is passed as a parameter, update it with the new value
    # unless params[:destination][:priority].nil?
    #   params[:destination][:priority] = params[:destination][:priority] == "true" ? true : false
    # end

    # # If has_been is being passed as a parameter, update it with the new value
    # unless params[:destination][:has_been].nil?
    #   params[:destination][:has_been] = params[:destination][:has_been] == "true" ? true : false
    # end

    params.require(:destination).permit(:country_id, :priority, :has_been, :status)
  end

  def calc_status(priority, has_been)
    if has_been
      return 1
    elsif !has_been && !priority
      return 2
    elsif !has_been && priority
      return 3
    end
  end
end

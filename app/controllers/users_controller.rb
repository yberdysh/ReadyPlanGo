class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]

  def show
    if current_user != @user
      redirect_to root_path
    end
    @destinations = current_user.destinations
  end

  def edit
  end

  def update
    @user.update(user_params)
    authorize @user
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache, :number_countries, :years)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end

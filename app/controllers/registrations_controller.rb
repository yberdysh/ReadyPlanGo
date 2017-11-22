class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :number_countries, :years, :email, :password, :password_confirmation, :airport_code)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :number_countries, :years, :email, :password, :password_confirmation, :current_password, :airport_code)
  end
end

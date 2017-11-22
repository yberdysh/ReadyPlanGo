class AddPhotographerUserNameToCountry < ActiveRecord::Migration[5.0]
  def change
     add_column :countries, :photographer_username, :string
  end
end

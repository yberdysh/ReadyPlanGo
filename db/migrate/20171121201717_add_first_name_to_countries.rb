class AddFirstNameToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :first_name, :string
  end
end

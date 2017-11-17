class AddAirportCodeToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :airport_code, :string
  end
end

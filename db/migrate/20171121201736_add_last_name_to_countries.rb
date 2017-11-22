class AddLastNameToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :last_name, :string
  end
end

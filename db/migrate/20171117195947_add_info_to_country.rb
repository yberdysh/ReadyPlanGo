class AddInfoToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :currency_name, :string
    add_column :countries, :capital, :string
  end
end

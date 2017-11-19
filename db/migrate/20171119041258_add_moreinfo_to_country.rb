class AddMoreinfoToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :population, :string
    add_column :countries, :national_dish, :string
    add_column :countries, :travel_languages, :text
  end
end

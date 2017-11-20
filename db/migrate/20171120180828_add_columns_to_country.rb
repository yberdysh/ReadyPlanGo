class AddColumnsToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :abbreviation, :string
    add_column :countries, :avg_male_height, :float
    add_column :countries, :calling_code, :string
    add_column :countries, :capital_city, :string
    add_column :countries, :currency_code, :string
    add_column :countries, :elevation, :string
    add_column :countries, :flag, :string
    add_column :countries, :government_type, :string
    add_column :countries, :independence_date, :integer
    add_column :countries, :iso, :integer
    add_column :countries, :landlocked, :boolean
    add_column :countries, :life_expectancy, :float
    add_column :countries, :population_density, :float
    add_column :countries, :avg_temperature_in_celsius, :float
  end
end

class RenameColumnsInCountry < ActiveRecord::Migration[5.0]
  def change
    rename_column :countries, :first_name, :photographer_first_name
    rename_column :countries, :last_name, :photographer_last_name
  end
end

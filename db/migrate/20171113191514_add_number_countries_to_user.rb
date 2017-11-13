class AddNumberCountriesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_countries, :integer
  end
end

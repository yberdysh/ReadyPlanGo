class AddYearsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :years, :integer
  end
end

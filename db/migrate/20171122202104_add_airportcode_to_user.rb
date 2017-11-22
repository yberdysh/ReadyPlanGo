class AddAirportcodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :airport_code, :string
  end
end

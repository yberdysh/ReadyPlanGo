class RemoveHasBeenFromDestinations < ActiveRecord::Migration[5.0]
  def change
    remove_column(:destinations, :has_been)
  end
end

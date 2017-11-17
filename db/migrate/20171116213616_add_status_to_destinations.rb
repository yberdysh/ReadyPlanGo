class AddStatusToDestinations < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :status, :integer, :default => 2
  end
end

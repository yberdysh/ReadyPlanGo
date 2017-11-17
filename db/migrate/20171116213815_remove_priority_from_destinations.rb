class RemovePriorityFromDestinations < ActiveRecord::Migration[5.0]
  def change
    remove_column(:destinations, :priority)
  end
end

class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :country_name
      t.boolean :has_been
      t.boolean :priority
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end

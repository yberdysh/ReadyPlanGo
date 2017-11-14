class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.boolean :has_been
      t.boolean :priority
      t.text :notes
      t.references :user, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end

class AddPhotoToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :photo, :string
  end
end

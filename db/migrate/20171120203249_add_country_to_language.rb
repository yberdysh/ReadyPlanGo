class AddCountryToLanguage < ActiveRecord::Migration[5.0]
  def change
    add_reference :languages, :country, foreign_key: true
  end
end

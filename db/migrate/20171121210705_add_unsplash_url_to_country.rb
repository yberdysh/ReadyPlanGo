class AddUnsplashUrlToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :unsplash_url, :string
  end
end

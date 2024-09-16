class AddGeocodingColumnToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :latitude, :float, null: false, default: 0
    add_column :trips, :longitude, :float, null: false, default: 0
  end
end

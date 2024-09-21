class AddLatitudeLongitudeToRegions < ActiveRecord::Migration[6.1]
  def change
    add_column :regions, :latitude, :float, null: false, default: 0
    add_column :regions, :longitude, :float, null: false, default: 0
  end
end

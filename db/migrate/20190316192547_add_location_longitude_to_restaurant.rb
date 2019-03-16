class AddLocationLongitudeToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :location_longitude, :float
  end
end

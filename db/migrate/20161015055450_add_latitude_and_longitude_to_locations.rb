class AddLatitudeAndLongitudeToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
    add_index :Locations, [:latitude, :longitude]

  end
end

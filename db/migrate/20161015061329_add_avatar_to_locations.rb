class AddAvatarToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :url, :string
  end
end

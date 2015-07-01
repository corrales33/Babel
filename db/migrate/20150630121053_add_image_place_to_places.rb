class AddImagePlaceToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :image_place, :string
  end
end

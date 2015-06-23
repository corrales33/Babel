class AddImageOfferToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :image_offer, :string
  end
end

class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :name
    	t.string :password
    	t.string :city
    	t.string :address
    	t.text :offers
    	t.text :opinions

      t.timestamps null: false
    end
  end
end

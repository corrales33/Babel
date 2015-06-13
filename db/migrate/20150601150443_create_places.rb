class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :name
    	t.string :password_digest
    	t.string :city
    	t.string :address
      t.float :average_place
    	t.text :offers
    	t.text :opinions
      t.string :role

      t.timestamps null: false
    end
  end
end

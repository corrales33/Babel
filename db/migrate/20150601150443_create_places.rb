class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :name
    	t.string :password_digest
    	t.string :city
    	t.string :address
      t.float :average_place
      t.string :timetable
    	t.text :offers

      t.timestamps null: false
    end
  end
end

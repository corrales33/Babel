class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|

    	t.string :name
    	t.string :password_digest

      t.timestamps null: false
    end
  end
end

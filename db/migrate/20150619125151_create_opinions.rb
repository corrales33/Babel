class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|

    	t.integer :user_id
    	t.integer :place_id
    	t.text :comment

      t.timestamps null: false
    end
  end
end

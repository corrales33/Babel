class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

    	t.integer :user_id
    	t.integer :place_id
      t.string :city
    	t.string :address
    	t.string :language
    	t.datetime :date
      t.string :participant

      t.timestamps null: false
    end
  end
end

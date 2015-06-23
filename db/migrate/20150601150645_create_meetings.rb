class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

    	t.integer :user_id
    	t.integer :place_id
    	t.string :place_meeting
    	t.string :language
      t.string :city
    	t.datetime :date
      t.text :participants
      t.string :part_confirm

      t.timestamps null: false
    end
  end
end

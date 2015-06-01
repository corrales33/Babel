class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

    	t.integer :user_registered_id
    	t.string :address
    	t.string :language
    	t.datetime :date

      t.timestamps null: false
    end
  end
end

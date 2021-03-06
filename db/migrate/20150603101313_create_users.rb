class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :name
    	t.string :nick
    	t.string :email
    	t.string :password_digest
    	t.float :average_user, default: 0
    	t.string :city
    	t.integer :age
    	t.string :job
    	t.string :languages_learnt
    	t.string :languages_without_learning
    	t.text :hobbies
        t.text :participants_in_rating

      t.timestamps null: false
    end
  end
end

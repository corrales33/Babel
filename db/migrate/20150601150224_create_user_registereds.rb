class CreateUserRegistereds < ActiveRecord::Migration
  def change
    create_table :user_registereds do |t|

    	t.string :name
    	t.string :nick
    	t.string :password
    	t.string :email
    	t.float :rating
    	t.string :city
    	t.integer :age
    	t.string :job
    	t.string :languages_learnt
    	t.string :languages_without_learning
    	t.text :hobbies
    	t.string :photo

      t.timestamps null: false
    end
  end
end

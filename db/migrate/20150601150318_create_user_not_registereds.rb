class CreateUserNotRegistereds < ActiveRecord::Migration
  def change
    create_table :user_not_registereds do |t|

    	t.string :nick
    	t.string :password

      t.timestamps null: false
    end
  end
end

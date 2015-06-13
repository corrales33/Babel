class AddImageToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :image, :string
  end
end

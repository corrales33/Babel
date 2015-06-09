class AddImagesToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :images, :json
  end
end

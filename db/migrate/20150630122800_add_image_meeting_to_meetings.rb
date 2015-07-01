class AddImageMeetingToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :image_meeting, :string
  end
end

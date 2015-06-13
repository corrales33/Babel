class AddVideoToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :video, :string
  end
end

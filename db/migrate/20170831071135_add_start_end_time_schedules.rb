class AddStartEndTimeSchedules < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :start_time, :datetime
  	add_column :schedules, :end_time, :datetime
  end
end

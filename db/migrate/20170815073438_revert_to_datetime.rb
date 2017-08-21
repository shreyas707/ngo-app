class RevertToDatetime < ActiveRecord::Migration[5.1]
  def change
  	remove_column :schedules, :time_of_class
  	remove_column :schedules, :date_of_class
  	add_column :schedules, :date_time_of_class, :datetime
  end
end

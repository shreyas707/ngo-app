class EditSchedule < ActiveRecord::Migration[5.1]
  def change
  	remove_column :schedules, :time_of_class
  	add_column :schedules, :time_of_class, :time
  	add_column :schedules, :date_of_class, :date
  end
end

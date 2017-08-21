class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|

      t.timestamps
      t.integer :educator_id
      t.integer :learner_id
      t.datetime :time_of_class
      t.boolean :confirmed, default: false
      t.float :class_duration, default: 0.0
      t.integer :chapter_id
    end
  end
end

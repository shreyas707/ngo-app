class CreateLearners < ActiveRecord::Migration[5.1]
  def change
    create_table :learners do |t|
      t.timestamps
      t.integer :user_id
      t.integer :grade
      t.integer :mentor_id #allow null
      t.time :start_time
      t.time :end_time
    end
  end
end

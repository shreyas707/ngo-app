class CreateEducators < ActiveRecord::Migration[5.1]
  def change
    create_table :educators do |t|

      t.timestamps
      t.integer :user_id
      t.boolean :certificate_required
      t.float :total_hours_logged
      t.float :weekly_hours_logged
      t.integer :weekly_goal
    end
  end
end

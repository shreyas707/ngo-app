class AddDeletedAtToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :deleted_at, :datetime
    add_index :subjects, :deleted_at
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :chapters, :deleted_at, :datetime
    add_index :chapters, :deleted_at
    add_column :educators, :deleted_at, :datetime
    add_index :educators, :deleted_at
    add_column :schedules, :deleted_at, :datetime
    add_index :schedules, :deleted_at
    add_column :learners, :deleted_at, :datetime
    add_index :learners, :deleted_at
    add_column :organizations, :deleted_at, :datetime
    add_index :organizations, :deleted_at
    add_column :educator_subjects, :deleted_at, :datetime
    add_index :educator_subjects, :deleted_at
  end
end

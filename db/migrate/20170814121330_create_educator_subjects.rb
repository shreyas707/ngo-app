class CreateEducatorSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :educator_subjects do |t|
      t.integer :educator_id
      t.integer :subject_id

      t.timestamps
    end
  end
end

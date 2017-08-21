class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|

      t.timestamps
      t.integer :subject_id
      t.string :name
    end
  end
end

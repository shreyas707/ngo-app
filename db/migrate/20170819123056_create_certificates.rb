class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.integer :educator_id
      t.integer :org_id
      t.integer :hours
      t.boolean :granted

      t.timestamps
    end
  end
end

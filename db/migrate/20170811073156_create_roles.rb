class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.timestamps
      t.string :name
    end
  end
end

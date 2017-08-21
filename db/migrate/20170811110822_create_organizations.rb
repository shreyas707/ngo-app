class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|

      t.timestamps
      t.string :name
      t.string :country
      t.string :state
      t.boolean :type_of_organization, default: false #school
      t.boolean :verified, default: false #not for right now, where only super_admin can create orgs but when orgs can sign up on their own..
    end
  end
end

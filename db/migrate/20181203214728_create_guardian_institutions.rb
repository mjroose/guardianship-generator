class CreateGuardianInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :guardian_institutions do |t|
      t.integer :guardianship_id
      t.string :name
      t.string :address
      t.string :phone
      t.string :fax
      t.string :agent_name
      
      t.timestamps
    end
  end
end

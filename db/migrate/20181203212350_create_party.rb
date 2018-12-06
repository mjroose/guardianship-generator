class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :guardianship_id
      t.string :party_type
      t.string :relationship_to_protected_person
      t.boolean :certified_guardian, default: false

      t.timestamps
    end
  end
end

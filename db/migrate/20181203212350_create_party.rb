class CreateParty < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :guardianship_id
      t.string :party_type
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.datetime :date_of_birth
      t.string :gender
      t.string :race
      t.boolean :hispanic, default: false
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :email
      t.integer :estimated_value
      t.string :eye_color
      t.string :hair_color
      t.string :height
      t.string :weight
      t.string :identifying_marks
      t.string :gal_name
      t.string :relationship_to_protected_person
      t.boolean :certified_guardian, default: false
      t.boolean :interpreter_required, default: false
      t.string :language
      t.integer :attorney_id
      t.timestamps
    end
  end
end

class CreateGuardianships < ActiveRecord::Migration[5.2]
  def change
    create_table :guardianships do |t|
      t.string :case_number
      t.integer :gu_type
      t.integer :protected_person_type
      t.integer :gu_duration
      t.timestamps
    end
  end
end

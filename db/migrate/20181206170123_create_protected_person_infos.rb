class CreateProtectedPersonInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :protected_person_infos do |t|
      t.integer :party_id
      t.integer :estimated_value
      t.string :eye_color
      t.string :hair_color
      t.string :height
      t.string :weight
      t.string :identifying_marks
      t.string :gal_name
      t.boolean :interpreter_required, default: false
      t.string :language
    end
  end
end

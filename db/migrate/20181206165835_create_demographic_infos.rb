class CreateDemographicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :demographic_infos do |t|
      t.integer :party_id
      t.datetime :date_of_birth
      t.string :gender
      t.string :race
      t.boolean :hispanic, default: false
    end
  end
end

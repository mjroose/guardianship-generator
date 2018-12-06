class CreateBasicPartyInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_party_infos do |t|
      t.integer :party_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.integer :attorney_id
    end
  end
end

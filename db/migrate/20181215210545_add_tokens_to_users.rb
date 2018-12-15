class AddTokensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :clio_access_token, :string
    add_column :users, :clio_refresh_token, :string
  end
end

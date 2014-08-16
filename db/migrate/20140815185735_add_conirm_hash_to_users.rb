class AddConirmHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirm_hash, :string
  end
end

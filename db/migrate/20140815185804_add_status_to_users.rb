# -*- encoding : utf-8 -*-
class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :integer
  end
end

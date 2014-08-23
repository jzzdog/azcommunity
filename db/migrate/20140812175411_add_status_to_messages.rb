# -*- encoding : utf-8 -*-
class AddStatusToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :status, :integer
  end
end

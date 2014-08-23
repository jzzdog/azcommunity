# -*- encoding : utf-8 -*-
class AddStatusToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :status, :integer
  end
end

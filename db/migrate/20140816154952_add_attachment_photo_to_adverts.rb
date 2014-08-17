class AddAttachmentPhotoToAdverts < ActiveRecord::Migration
  def self.up
    change_table :adverts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :adverts, :photo
  end
end

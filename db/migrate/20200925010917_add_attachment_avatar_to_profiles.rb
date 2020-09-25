class AddAttachmentAvatarToProfiles < ActiveRecord::Migration[6.0]
  def self.up
    change_table :profiles do |t| # this means changes is made to profile table
      t.attachment :avatar # This means a column called avatar has been added.
    end
  end

  def self.down
    remove_attachment :profiles, :avatar
  end
end

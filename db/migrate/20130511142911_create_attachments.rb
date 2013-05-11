class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :mail_id
      t.integer :index
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end

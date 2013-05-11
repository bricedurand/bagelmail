class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.integer :user_id
      t.string :sender
      t.integer :attachment_count
      t.string :state

      t.timestamps
    end

    add_index :mails, [:user_id, :created_at]
  end
end

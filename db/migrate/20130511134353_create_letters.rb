class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :user_id
      t.string :sender
      t.integer :attachment_count
      t.string :state

      t.timestamps
    end

    add_index :letters, [:user_id, :created_at]
  end
end

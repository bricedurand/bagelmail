class AddPaypalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_payerid, :string
    add_column :users, :paypal_token, :string
  end
end

class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone_number, :string
    add_column :users, :address_street, :string
    add_column :users, :address_zipcode, :string
    add_column :users, :address_city, :string
    add_column :users, :address_country, :string
    add_column :users, :address_details, :string
    add_column :users, :public_id, :string
  end
end

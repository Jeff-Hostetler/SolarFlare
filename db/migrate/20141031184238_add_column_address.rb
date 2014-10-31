class AddColumnAddress < ActiveRecord::Migration
  def change
    add_column :users, :address_street_number, :string
    add_column :users, :address_street, :string
    add_column :users, :address_city, :string
    add_column :users, :address_state, :string
    add_column :users, :address_zip, :string
  end
end

class ChangeAddressStreetToAddressDeleteAddressStreetNumber < ActiveRecord::Migration
  def change
    rename_column :users, :address_street, :address
    remove_column :users, :address_street_number
  end
end

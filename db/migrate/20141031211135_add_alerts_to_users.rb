class AddAlertsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :text_alert, :boolean
    add_column :users, :email_alert, :boolean
  end
end

class CorrectUsersidToUseridSensors < ActiveRecord::Migration
  def change
    rename_column :sensors, :users_id, :user_id
  end
end

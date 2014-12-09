class SensorBelongsToUser < ActiveRecord::Migration
  def change
    add_reference :sensors, :users, index: true
  end
end

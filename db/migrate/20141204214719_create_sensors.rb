class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.integer :data_point

      t.timestamps
    end
  end
end

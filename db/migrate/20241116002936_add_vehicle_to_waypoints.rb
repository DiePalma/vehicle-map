class AddVehicleToWaypoints < ActiveRecord::Migration[7.1]
  def change
    add_reference :waypoints, :vehicle, null: false, foreign_key: true
  end
end

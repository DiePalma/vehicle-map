class CreateWaypoints < ActiveRecord::Migration[7.1]
  def change
    create_table :waypoints do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :sent_at
      t.string :vehicle_identifier

      t.timestamps
    end
  end
end

class CreateWaypointJob < ApplicationJob
  queue_as :default

  def perform(waypoint_params)
    
    vehicle = Vehicle.find_or_create_by(identifier: waypoint_params[:vehicle_identifier])
    waypoint = vehicle.waypoints.create!(waypoint_params)
    
    waypoint.save!
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error adding waypoint: #{e.message}")
  end
end

module Api
    module V1
class Api::V1::WaypointsController < ApplicationController
    
    def index
        waypoints = Waypoint.all
        render json:waypoints
    end
    def show
        
        latest_waypoints = Vehicle.includes(:waypoints)
                                 .map do |vehicle|
          latest_waypoint = vehicle.waypoints.order(sent_at: :desc).first
          
          
         
            
            if latest_waypoint 
                {
              latitude: latest_waypoint.latitude,
              longitude: latest_waypoint.longitude,
              sent_at: latest_waypoint.sent_at,
              vehicle_identifier: latest_waypoint.vehicle_identifier
            } 
        else nil
        end
        end
    
        render json: latest_waypoints, status: :ok
      end

    def create
        if waypoint_params.values.all?(&:present?)
            CreateWaypointJob.perform_later(waypoint_params.to_h)
            render json:{message: 'processing waypoint in background'}, status: :ok
        else
            render json:{error: 'error processing waypoint params'}, status: :unprocessable_entity       
        end
    end

    


    def waypoint_params
        params.require(:waypoint).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end



end
end
end

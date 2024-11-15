module Api
    module V1
class Api::V1::WaypointsController < ApplicationController
    
    def index
        waypoints = Waypoint.all
        render json:waypoints
    end

    def show
        waypoint = Waypoint.find(params[:vehicle_identifier])
        render json:waypoint
    end

    def create
        waypoint = Waypoint.new(waypoint_params)
        if waypoint.save
            render json: waypoint, status: :created
        else
            render json: waypoint.errors, status: :unprocessable_entity
        end
    end

    def waypoint_params
        params.require(:waypoint).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end
end
end

end

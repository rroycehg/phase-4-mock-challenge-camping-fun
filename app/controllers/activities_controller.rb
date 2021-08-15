class ActivitiesController < ApplicationController
    
    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = get_activity
        if activity
            activity.signups.destroy_all
            activity.destroy
            head :no_content
        else
            render json: { "error": "Activity not found"}, status: :not_found
        end
    end    
       
        
private

    def get_activity
        Activity.find_by(id: params[:id])
    end
end

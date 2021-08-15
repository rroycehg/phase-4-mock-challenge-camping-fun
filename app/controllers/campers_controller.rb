class CampersController < ApplicationController

    def index
        camper = Camper.all 
        render json: camper
    end

    def show 
        camper = find_camper
        if camper
            render json: camper
        else
            render json: { "error": "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: { "errors": ["validation errors"] }, status: :unprocessable_entity
        end
    end


    private

 def find_camper
     Camper.find_by(id: params[:id])
 end

 def camper_params
    params.permit(:name, :age)
 end

end

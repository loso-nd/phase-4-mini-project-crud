class SpicesController < ApplicationController
    #GET /spice
    def index 
        spices = Spice.all
        render json: spices, except: [:created_at, :updated_at]
    end

    def show 
        spice = Spice.find_by(id: params[:id])
        render json: spice, except: [:created_at, :updated_at]
    end

    #POST /spice
    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spice/:id
    def update 
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice, status: :created
    end

    #DELETE /spice/:ID
    def destroy 
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end
end

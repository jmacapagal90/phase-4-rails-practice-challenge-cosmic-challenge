class ScientistsController < ApplicationController

    before_action :set_scientist, only: [:show,:update,:destroy]

    def index
        render json: Scientist.all
    end

    def show
        render json: @scientist, serializer: ScientistWithPlanetsSerializer
    end

    def create
        new_scientist = Scientist.create!(scientist_params)
        render json: new_scientist, status: :created
    end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    def destroy
        @scientist.destroy
    end


    private

    def set_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name,:field_of_study,:avatar)
    end

end

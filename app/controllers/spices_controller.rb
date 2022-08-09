class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Spice.all
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    def update
        spice = find_spice
        spice.update(new_spice)
        render json: spice
    end

    def create
        render json: Spice.create(new_spice), status: :created
    end

    private

    def new_spice
        params.permit(:title,:image,:description,:notes,:rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def not_found
        render json: {error: "not found"}, status: :not_found
    end
end

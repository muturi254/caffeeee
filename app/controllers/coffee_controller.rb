class CoffeeController < ApplicationController

    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid_record

    def index
        coffee = Coffee.all
        render json: coffee, except: [:created_at, :updated_at], methods: [:summary], include: :barister
    end

    def show
        coffee = Coffee.find(params[:id])
        render json: coffee
    end

    def update
        coffee = Coffee.find(params[:id])
        coffee.update(permit_params)
        render json: coffee,  except: [:created_at, :updated_at]
    end

    def create
        coffee = Coffee.create!(permit_params)
        # byebug
        render json: coffee, except: [:created_at, :updated_at], status: :ok
    end

    private
    def permit_params
        params.permit(:name, :size, :price, :barister_id)
    end

    def rescue_record_not_found
        render json: {error: "coffee not found"}
    end

    def rescue_invalid_record(e)
        render json: {error: e.record.errors.full_messages}
    end

end

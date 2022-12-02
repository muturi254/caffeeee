class BaristersController < ApplicationController

    before_action :authenticate
    skip_before_action :authenticate, only: [:create]

    def index
        # return render json: {error: "not logged in"}, status: :unauthorized unless session.include? :user_id
        baristers = Barister.all
        render json: baristers
    end

    def create
        # byebug
        barister = Barister.create(barister_params)
        if barister.valid?
            jwt = encode({user_id: barister.id})
            render json: {barister: BaristerSerializer.new(barister), jwt: jwt}, status: :created
        else
            render json: {error: "wrong data"}
        end
    end

    def show
        barister = Barister.find(params[:id])
        render json: barister
    end

    private
    def barister_params
        params.permit(:name, :age, :password)
    end
end

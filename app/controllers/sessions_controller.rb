class SessionsController < ApplicationController

    def index
        # byebug
        cookies[:user_name] ||= "peter"
        session[:session_user_name] ||= "mary"
        render json: {cookie: cookies[:user_name], session: session[:session_user_name]}
    end

    def create
        barister = Barister.find_by(name: params[:name])
        if barister&.authenticate(params[:password])
            jwt = encode({user_id: barister.id})
            render json: {barister: BaristerSerializer.new(barister), jwt: jwt}, status: :created
        else
            render json: {error: "wrong credentials"}, status: :unauthorized
        end
        # byebug
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

  
end

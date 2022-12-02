class ApplicationController < ActionController::API

    include ActionController::Cookies

     
    

    def auth_header
        request.headers['Authorization']
    end

    def encode(payload)
        JWT.encode(payload, "secret")
    end

    def decode
        if auth_header
            begin
                token = auth_header.split(' ')[1]
                JWT.decode(token, "secret")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decode
            barister_id = decode[0]["user_id"]
            barister = Barister.find_by(id: barister_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authenticate
        return render json: {error: "wrong credentials"}, status: :unauthorized unless logged_in?
    end

    

end

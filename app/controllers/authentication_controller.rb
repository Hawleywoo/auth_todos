class AuthenticationController < ApplicationController

    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: { message: "No user with that username"}, status: :unauthorized
        else
            if !@user.authenticate(params[:password])
                render json: { error: 'Wrong password'}, status: :unauthorized
            else
                render json: { message: "logged in" }
            end
        end
    end
end

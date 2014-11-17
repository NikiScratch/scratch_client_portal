class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        type = user.type
        if type == "Client"
            redirect_to venues_path
        else
            redirect_to events_path(:user_id => user.id)
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end

    def failure
        redirect_to root_url, alert: "Authentication failed, please try again"
    end
end
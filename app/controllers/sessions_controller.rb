class SessionsController < ApplicationController
    def omniauth_log_in # How do we test for this?
        user_info = request.env['omniauth.auth'][:info]
        
        user = UserFacade.new.find_by_email(user_info[:email])

        if user.nil?
            flash[:error] = "Invalid email"
            redirect_to "/"
        else
            session[:user_id] = user.id
            flash[:success] = "Welcome, #{user.name}!"
            redirect_to "/users/#{user.id}"
        end
    end
end
class SessionsController < ApplicationController
    def omniauth_log_in
        user_info = request.env['omniauth.auth'][:info]
        
        user = UserFacade.new.find_by_email(user_info[:email])
        require 'pry'; binding.pry

        if user.nil?
            flash[:error] = "Invalid email"
            redirect_to "/"
        else
            session[:user_id] = user.id
            flash[:success] = "Welcome, #{user.name}!"
            redirect_to "/users/#{user.id}"
        end
        
        # user = UserFacade.from_omniauth

    end
end
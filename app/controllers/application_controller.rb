class ApplicationController < ActionController::Base

    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    #helper_method :signed_up?
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end
    
    #def signed_up?
    #    User.new?
    #end

    def authorized
        redirect_to'/welcome' unless logged_in?        
    end
end

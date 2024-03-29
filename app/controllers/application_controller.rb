class ApplicationController < ActionController::Base
    helper_method :current_user
    def log_in_user!(user)
        @current_user = user
        session[:session_token] = @current_user.session_token
    end
    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(:session_token => session[:session_token])
    end
    def logout!
        current_user.try(:reset_session_token!)
        session[:session_token] = nil
    end
end

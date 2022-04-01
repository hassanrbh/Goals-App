class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        user = User.find_by_credentials!(
            params[:users][:email],
            params[:users][:password]
        )
        if user.present?
            log_in_user!(user)
            redirect_to user_path(user.id)
        else
            render :new
        end
    end

    def destroy
        logout!
        redirect_to root_path
    end
end

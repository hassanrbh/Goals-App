class UsersController < ApplicationController
    def index
        if params[:s]
            @user = User.find_by(:username => params[:s])
            redirect_to user_path(@user.id)
        else
            @users = User.all
            render :index
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
        if @user.present?
            render :show
        else
            redirect_to users_path
        end
    end
    def new
        @user = User.new
        render :new
    end
    def create
        @user = User.new(users_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def users_params
        params.require(:users).permit(:email,:username,:password, :birth_date)
    end
end

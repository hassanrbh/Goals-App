class IntentionsController < ApplicationController
    def new
        intention = Intention.new
        render :new
    end
    def create
        intention = Intention.new(intentions_params)
        intention.user_id = current_user.id

        if intention.save
            flash[:success] = "You have successfully created"
            redirect_to intention_path(intention.id)
        else
            flash[:error] = "An error has occurred"
            render :new
        end
    end
    def show
        @intention = Intention.find_by(:id => params[:id])
        
        if @intention.present?
            render :show
        else
            redirect_to users_path            
            flash[:error] = "The Goal is not available"
        end
    end

    def intentions_params
        params.require(:intentions).permit(:name,:status,:user_id)
    end
end

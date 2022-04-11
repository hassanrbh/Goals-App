class LikesController < ApplicationController
    def create
        params[:likes][:user_id] = current_user.id
        @like = Like.new(likes_params)
        if @like.save
            flash[:success] = 'Thanks for liking!'
        else
            flash[:alert] = @like.errors.full_messages.join(', ')
        end
    end
    def destroy
        @like = current_user.likes.find_by(:id => params[:id])
        @like.destroy
    end

    private 
    def likes_params
        params.require(:likes).permit(:user_id, :likeable_type, :likeable_id)
    end
end

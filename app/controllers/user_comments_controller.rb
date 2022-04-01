class UserCommentsController < ApplicationController
    def create
        user_comment = UserComment.new(goal_comments_params)
        if user_comment.save
            redirect_to user_path(params[:user_comments][:user_id])
            flash[:success] = "Comment created successfully"
        else
            redirect_to user_path(params[:user_comments][:user_id])
            flash[:error] = user_comment.errors.full_messages
        end
    end

    private
    def goal_comments_params
        params.require(:user_comments).permit(:comment, :user_id)
    end
end

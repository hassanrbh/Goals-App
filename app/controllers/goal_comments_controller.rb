class GoalCommentsController < ApplicationController
    def create
        goal_comment = GoalComment.new(goal_comments_params)
        if goal_comment.save
            redirect_to intention_path(params[:goal_comments][:intention_id])
            flash[:success] = "Comment created successfully"
        else
            redirect_to intention_path(params[:goal_comments][:intention_id])
            flash[:error] = goal_comment.errors.full_messages
        end
    end

    private
    def goal_comments_params
        params.require(:goal_comments).permit(:comment, :intention_id)
    end
end

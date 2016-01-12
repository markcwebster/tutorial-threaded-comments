class CommentsController < ApplicationController
before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new comment_params

      if @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Story.find_by_id(params[:story_id]) if params[:story_id]
    end

end

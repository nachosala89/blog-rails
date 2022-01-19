class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
    end
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    user = current_user
    @post = Post.find(params[:id])
    comment.author = user
    comment.post = @post
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = "Comment saved successfully"
          redirect_to posts_url(user.id)
        else
          flash.now[:error] = "Error: Comment could not be saved"
          render :new, locals: { comment: comment }
        end
      end
    end
  end
end

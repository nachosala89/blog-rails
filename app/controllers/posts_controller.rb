class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post} }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    user = current_user
    post.author = user
    post.comments_counter = 0
    post.likes_counter = 0
    respond_to do |format|
        format.html do
            if post.save
                flash[:success] = "post saved successfully"
                redirect_to posts_url(user.id)
            else
                flash.now[:error] = "Error: Post could not be saved"
                render :new, locals: { post: post }
            end
        end
    end
  end
end
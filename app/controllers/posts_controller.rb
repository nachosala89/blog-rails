class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id])
  end

  def show
    @post = Post.find(params[:post_id])
  end
end

class LikesController < ApplicationController
  def create
    user = current_user
    post = Post.find(params[:id])
    like = Like.new(author: user, post:)
    like.save
    redirect_to posts_url(user.id)
  end
end

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_counter(current_post_id = post_id)
    post = Post.find(current_post_id)
    post.likes_counter = Like.where(post_id: post.id).count
    post.save
  end
end

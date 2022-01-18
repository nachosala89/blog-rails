class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_counter

  def update_counter(current_post_id = post_id)
    post = Post.find(current_post_id)
    post.increment!(:likes_counter)
    post.save
  end
end

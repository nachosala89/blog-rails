class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :like

  def update_counter(user_id = author_id)
    user = User.find(user_id)
    user.posts_counter = Post.where(author_id: user.id).count
    user.save
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end

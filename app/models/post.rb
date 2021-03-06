class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_counter

  def update_counter(user_id = author_id)
    user = User.find(user_id)
    user.increment!(:posts_counter)
    user.save
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end

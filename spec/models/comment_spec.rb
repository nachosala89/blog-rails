require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Testing update_counter method" do
    user = User.new(name: "John Smith", photo: "example/url", bio: "Software Developer", posts_counter: 0)
    user.save
    post = Post.new(title: "Post 1", text: "Lorem Ipsum 1", author: user, comments_counter: 0, likes_counter: 0)
    post.save

    it "should return 1" do
      comment = Comment.new(text: "Comment 1", author: user, post: post)
      comment.save
      post = Post.find(post.id)
      expect(post.comments_counter).to eq(1)
    end
  end
end

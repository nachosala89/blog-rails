require 'rails_helper'

RSpec.describe Post, type: :model do
  
  user = User.new(name: "John Smith", photo: "example/url", bio: "Software Developer", posts_counter: 0)
  user.save

  context "Testing validations on a single subject" do
    subject { Post.new(title: "Post 1", text: "Lorem Ipsum 1", author: user, comments_counter: 0, likes_counter: 0) }

    it "is valid with the inserted valid attributes" do
      expect(subject).to be_valid
    end

    it "title must not be blank" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "title must not exceed 250 characters" do
      subject.title = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem 
        accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo 
        inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo 
        enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
        consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
      expect(subject).to_not be_valid
    end

    it "comments_counter must be an integer greater than or equal to zero" do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it "likes_counter must be an integer greater than or equal to zero" do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context "Testing recent_comments method" do
    post = Post.new(title: "Post 1", text: "Lorem Ipsum 1", author: user, comments_counter: 0, likes_counter: 0)
 
    before { post.save }
    
    before(:all) do
      Comment.new(text: "Lorem Ipsum 1", author: user, post: post).save
      Comment.new(text: "Lorem Ipsum 2", author: user, post: post).save
      Comment.new(text: "Lorem Ipsum 3", author: user, post: post).save
      Comment.new(text: "Lorem Ipsum 4", author: user, post: post).save
      Comment.new(text: "Lorem Ipsum 5", author: user, post: post).save
      Comment.new(text: "Lorem Ipsum 6", author: user, post: post).save
    end

    it "should return only 5 comments" do
      recent_comments = post.recent_comments
      expect(recent_comments.length).to eq(5)
    end
  end

  context "Testing update_counter method when a Post is saved" do
    user = User.new(name: "John Smith", photo: "example/url", bio: "Software Developer", posts_counter: 0)
    user.save
    it "should return 1" do
      Post.new(title: "Post 1", text: "Lorem Ipsum 1", author: user, comments_counter: 0, likes_counter: 0).save
      new_user = User.find(user.id)
      expect(new_user.posts_counter).to eq(1)
    end
  end
end

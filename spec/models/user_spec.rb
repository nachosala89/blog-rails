require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing validations on a single subject' do
    subject { User.new(name: 'John Smith', photo: 'example/url', bio: 'Software Developer', posts_counter: 0) }
    before { subject.save }

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter must be an integer greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'Testing recent_posts method' do
    user = User.new(name: 'John Smith', photo: 'example/url', bio: 'Software Developer', posts_counter: 0)

    before { user.save }
    before(:all) do
      Post.new(title: 'Post 1', text: 'Lorem Ipsum 1', author: user, comments_counter: 0, likes_counter: 0).save
      Post.new(title: 'Post 2', text: 'Lorem Ipsum 2', author: user, comments_counter: 0, likes_counter: 0).save
      Post.new(title: 'Post 3', text: 'Lorem Ipsum 3', author: user, comments_counter: 0, likes_counter: 0).save
      Post.new(title: 'Post 4', text: 'Lorem Ipsum 4', author: user, comments_counter: 0, likes_counter: 0).save
    end

    it 'should return only 3 posts' do
      recent_posts = user.recent_posts
      expect(recent_posts.length).to eq(3)
    end
  end
end

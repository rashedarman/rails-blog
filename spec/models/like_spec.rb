require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update the likes_counter of the given post' do
    post = Post.new(author: User.new, title: 'Post Title')
    Like.create(author: User.new, post:)
    Like.create(author: User.new, post:)
    Like.update_likes_counter(post)
    expect(post.likes_counter).to be(2)
  end
end

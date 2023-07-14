require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update the comments_counter of the given post' do
    post = Post.new(author: User.new, title: 'Title')
    Comment.create(author: User.new, post:)
    Comment.create(author: User.new, post:)
    Comment.update_comments_counter(post)
    expect(post.comments_counter).to be(2)
  end
end

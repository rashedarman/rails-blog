require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Terry Medhurst', photo: 'https://robohash.org/hicveldicta.png', bio: 'Bio Text', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 4.99
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater or equal to 0' do
    subject.posts_counter = -10
    expect(subject).to_not be_valid
  end

  it 'show the last 3 recent posts' do
    Post.create(author: subject, title: 'first', text: 'first post', comments_counter: 0, likes_counter: 0)
    second_post = Post.create(author: subject, title: 'second', text: 'second post', comments_counter: 0,
                              likes_counter: 0)
    third_post = Post.create(author: subject, title: 'third', text: 'third post', comments_counter: 0,
                             likes_counter: 0)
    fourth_post = Post.create(author: subject, title: 'fourth', text: 'fourth post', comments_counter: 0,
                              likes_counter: 0)
    results = [fourth_post, third_post, second_post]
    expect(subject.three_most_recent_posts).to eq(results)
  end
end

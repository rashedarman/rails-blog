require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    author = User.new(name: 'Terry Medhurst', photo: 'https://robohash.org/hicveldicta.png', bio: 'Bio Text',
                      posts_counter: 0)
    Post.new(
      author:,
      title: 'Title',
      text: 'Text',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  it 'checks title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title be 250 characters or less' do
    subject.title = 'a' * 250
    expect(subject).to be_valid
  end

  it 'title should not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 4.99
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to 0' do
    subject.comments_counter = -10
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer' do
    subject.likes_counter = 4.99
    expect(subject).to_not be_valid
  end

  it 'likes_counter hsould be greater or equal to 0' do
    subject.likes_counter = -10
    expect(subject).to_not be_valid
  end

  it 'should show 5 most recent comments' do
    Comment.create(post: subject, author: subject.author, text: 'first comment')
    second_comment = Comment.create(post: subject, author: subject.author, text: '2ne comment')
    third_comment = Comment.create(post: subject, author: subject.author, text: '3rd comment')
    fourth_comment = Comment.create(post: subject, author: subject.author, text: '4th comment')
    fifth_comment = Comment.create(post: subject, author: subject.author, text: '5th comment')
    sixth_comment = Comment.create(post: subject, author: subject.author, text: '6th comment')
    results = [sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment]
    expect(subject.five_most_recent_comments).to eq(results)
  end
end

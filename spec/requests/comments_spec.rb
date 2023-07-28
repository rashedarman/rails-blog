require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Terry Medhurst',
      photo: 'https://robohash.org/hicveldicta.png',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 0
    )
    @post = Post.create(
      author: @user,
      title: 'Amazing Journey',
      text: 'First step into the unknown',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_user_post_comment_path(@user, @post)
      expect(response).to be_successful
    end
  end
end

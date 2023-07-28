require 'rails_helper'

RSpec.describe Post, type: :request do
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

  describe 'GET /index' do
    it 'should return successful response' do
      get user_posts_path(@user.id)
      expect(response).to be_successful
    end

    it 'should render :index template' do
      get user_posts_path(@user.id)
      expect(response).to render_template(:index)
    end

    it 'should return correct response body' do
      get user_posts_path(@user.id)
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET /show' do
    it 'should return successful response' do
      get user_post_path(@user, @post)
      expect(response).to be_successful
    end

    it 'should render :show template' do
      get user_post_path(@user, @post)
      expect(response).to render_template(:show)
    end

    it 'should return correct response body' do
      get user_post_path(@user, @post)
      expect(response.body).to include(@post.title)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Terry Medhurst',
      photo: 'https://robohash.org/hicveldicta.png',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 0
    )
  end

  describe 'GET /index' do
    it 'should return successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'should render :index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'should return correct response body' do
      get users_path
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET /show' do
    it 'should return successful response' do
      get user_path(@user)
      expect(response).to be_successful
    end

    it 'should render :show template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end

    it 'should return correct response body' do
      get user_path(@user)
      expect(response.body).to include(@user.bio)
    end
  end
end

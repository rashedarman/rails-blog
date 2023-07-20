require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts#index' do
    it 'should return successful response' do
      get '/users/:user_id/posts/'
      expect(response).to be_successful
    end

    it 'should render :index template' do
      get '/users/:user_id/posts/'
      expect(response).to render_template(:index)
    end

    it 'should return correct response body' do
      get '/users/:user_id/posts/'
      expect(response.body).to include('List of posts')
    end
  end

  describe 'posts#show' do
    it 'should return successful response' do
      get '/users/:user_id/posts/:id'
      expect(response).to be_successful
    end

    it 'should render :show template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'should return correct response body' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Current post')
    end
  end
end

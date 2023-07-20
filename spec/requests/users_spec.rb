require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'users#index' do
    it 'should return successful response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'should render :index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'should return correct response body' do
      get '/users'
      expect(response.body).to include('List of users')
    end
  end

  describe 'users#show' do
    it 'should return successful response' do
      get '/users/:id'
      expect(response).to be_successful
    end

    it 'should render :show template' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'should return correct response body' do
      get '/users/:id'
      expect(response.body).to include('Current user')
    end
  end
end

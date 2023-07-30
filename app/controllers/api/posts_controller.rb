class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find(request.params['user_id'])
    render json: @user.posts.all
  end
end

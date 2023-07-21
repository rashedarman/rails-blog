class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user_id = params[:id]
    @user = User.find(@user_id)
  end
end

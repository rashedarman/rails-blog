class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.author = current_user
    respond_to do |f|
      f.html { redirect_back(fallback_location: root_path) } if @like.save
    end
  end

  def like_params
    params.permit(:author_id, :post_id)
  end
end

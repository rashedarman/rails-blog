class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id: @post.id)

    respond_to do |f|
      f.html { redirect_back(fallback_location: root_path) } if @like.save
    end
  end

  def like_params
    params.permit(:author_id, :post_id)
  end
end

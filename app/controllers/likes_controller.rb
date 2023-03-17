class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new(user_id: current_user.id, post_id: @post.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
  end

  private

  # def like_params
  #   params.require(:post).permit(user_id: current_user.id,  item_id: @post.id)
  # end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

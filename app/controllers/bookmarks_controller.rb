class BookmarksController < ApplicationController
  before_action :set_post

  def create
    @bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id)
    @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, post_id: @post.id)
    @bookmark.destroy
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

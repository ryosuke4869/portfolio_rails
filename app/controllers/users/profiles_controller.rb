class Users::ProfilesController < ApplicationController
  def show
    @user = current_user
    @posts = current_user.posts.page(params[:page]).per(6)
    @like_posts = @user.like_posts.page(params[:page]).per(6)
    @bookmark_posts = @user.bookmark_posts.page(params[:page]).per(6)

    # raderchartの変数
    # 投稿数
    gon.rader_post = @user.posts.count
    # いいねした数
    gon.rader_likes = @user.likes.count
    # いいねされた数
    gon.rader_post_by_liked = @user.get_liked_post
    # 保存した投稿数
    gon.rader_bookmarks = @user.bookmarks.count
    # 登録したアイテム数
    gon.rader_post_items = @posts.map { |post| post.items.count }.sum
  end

  private

  def current_user_params
    params.require(:user).permit(:name, :email)
  end
end

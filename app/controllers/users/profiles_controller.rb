class Users::ProfilesController < ApplicationController
  def show
    @user = current_user
    @posts = current_user.posts.all
    @like_posts = @user.like_posts
    @bookmark_posts = @user.bookmark_posts
  end

  private

  def current_user_params
    params.require(:user).permit(:name, :email)
  end
end

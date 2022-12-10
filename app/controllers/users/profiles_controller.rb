class Users::ProfilesController < ApplicationController
  def show
    @user = current_user
    @posts = current_user.posts.all
  end
end
def current_user_params
  params.require(:user).permit(:name, :email)
end

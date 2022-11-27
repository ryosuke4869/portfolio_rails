class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]#全てのアクション(showアクションを除く)前にユーザーがログインしているかを確認
#投稿用
  def index
    @posts = current_user.posts.all
    flash[:notice] = "ログインしていません" unless user_signed_in?
  end

  def new #新規登録画面
    @post = current_user.posts.new
  end

  def create #登録処理
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "#{@post.desk_name}を登録しました。"
    else
      flash[:alert] = "登録に失敗しました. <br>・#{@post.errors.full_messages.join('<br>・')}"
      render"new"
    end
  end

  def show 
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:id, :desk_name, :description)
    end
end

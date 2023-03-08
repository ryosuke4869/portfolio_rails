class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]#全てのアクション(showアクションを除く)前にユーザーがログインしているかを確認
  before_action :check_user, only: [:edit, :update, :destroy]
#投稿用
  def index
    @posts = Post.all
    @user = User.all
    flash[:alert] = "ログインしていません" unless user_signed_in?
  end

  def new #新規登録画面
    @post = current_user.posts.new
  end

  def create #登録処理
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました。"
    else
      flash[:alert] = "投稿に失敗しました. <br>・#{@post.errors.full_messages.join('<br>・')}"
      render"new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @items = @post.items
    @item_count = PostItem.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "投稿を削除しました。"
  end

  private
    def post_params
      params.require(:post).permit(:id, :description, desk_images:[], category_ids:[])
    end
    #自身が投稿したものだけ編集と削除が可能
    def check_user
      @posts = current_user.posts
      @post = @posts.find_by(id: params[:id])
      redirect_to new_post_path unless @post
    end
end

class PostsController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]
  # 投稿用
  def index
    @user = User.all
    flash[:alert] = "ログインしていません" unless user_signed_in?
    @q = Post.ransack(params[:q])
    sorting_param = params[:q]&.dig(:s)
    @posts = apply_sorting(@q.result(distinct: true), sorting_param)
    @posts ||= Post.all
  end

  def new # 新規登録画面
    @post = current_user.posts.new
  end

  def create # 登録処理
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to posts_path
    else
      render :new
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
    flash[:notice] = "投稿を編集しました。"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:id, :description, desk_images: [], category_ids: [])
  end

  # 自身が投稿したものだけ編集と削除が可能
  def check_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @post
  end
end

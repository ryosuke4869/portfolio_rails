class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]
  # 投稿用
  def index
    @user = User.all
    flash[:alert] = "ログインしていません" unless user_signed_in?
  # ransackを使用したsort機能
    @q = Post.ransack(params[:q])
    if params[:q] && params[:q][:s].present?
      if params[:q][:s] == 'created_at asc' || params[:q][:s] == 'created_at desc'
      created_at_order = params[:q][:s] == 'created_at asc' ? 'ASC' : 'DESC'
      @posts = @q.result(distinct: true)
                  .order("created_at #{created_at_order}")
      elsif params[:q][:s] == 'likes asc' || params[:q][:s] == 'likes desc'
        likes_order = params[:q][:s] == 'likes asc' ? 'ASC' : 'DESC'
        @posts = @q.result(distinct: true)
                .left_joins(:likes)
                .group('posts.id')
                .order(Arel.sql("COALESCE(COUNT(likes.id), 0) #{likes_order}"))
      elsif params[:q][:s] == 'bookmarks asc' || params[:q][:s] == 'bookmarks desc'
        bookmarks_order = params[:q][:s] == 'bookmarks asc' ? 'ASC' : 'DESC'
        @posts = @q.result(distinct: true)
        .left_joins(:bookmarks)
        .group('posts.id')
        .order(Arel.sql("COALESCE(COUNT(bookmarks.id), 0) #{bookmarks_order}"))
      end
    else
      @posts = @q.result(distinct: true)
    end
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

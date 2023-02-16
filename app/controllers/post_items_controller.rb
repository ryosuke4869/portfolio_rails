class PostItemsController < ApplicationController
  before_action :set_post
  def create
    @item = Item.find_by(name: params[:item_name])
    @post_item = PostItem.new(post_id: @post.id, item_id: @item.id)
    if @post_item.save
      redirect_to post_path(@post.id)
      flash[:notice] = "アイテムを登録しました。"
    else
      flash[:alert] = "アイテムの登録に失敗しました."
    end
  end

  def destroy

  end

  private
  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

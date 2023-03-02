class PostItemsController < ApplicationController
  before_action :set_post

  def create
    @item = Item.find_by(name: params[:item_name])
    @post_item = PostItem.new(post_id: @post.id, item_id: @item.id)

    item_count = PostItem.where(post_id: @post.id).count
    binding.pry

    if @post_item.valid?
      if item_count < 12
        binding.pry
        @post_item.save
        redirect_to post_path(@post.id)
        flash[:notice] = "アイテムを登録しました。"
      else
        redirect_to post_path(@post.id)
        flash[:notice] = "アイテムは12個までしか登録できません。"
      end
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

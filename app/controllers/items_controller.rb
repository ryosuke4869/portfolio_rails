class ItemsController < ApplicationController

  before_action :set_post

  def search_items
    @items = []
    @search = params[:keyword]
    if @search
      @results = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword], hits: 5)
      @results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
    #Itemテーブルに同じアイテムがあれば保存しない処理を書く
    @items.each do |item|
      unless Item.all.exists?(name: item.name)
        item.save
      end
    end
  end

  def create
    @post_item = PostItem.new(post_id: @post.id, item_id: item.id)
    post_item.save
  end

  private
  def read(result)
    name = result["productName"]
    price = result["averagePrice"]
    image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    item_url = result["affiliateUrl"]
    {
      name: name,
      price: price,
      image_url: image_url,
      item_url: item_url
    }
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def create_params
    params.permit(:item)
  end
end

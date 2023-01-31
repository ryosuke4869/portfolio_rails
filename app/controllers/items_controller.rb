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
        #Itemテーブルに同じアイテムがあれば保存しない処理を書く
        @items.each do |item|
          unless Item.all.exists?(name: item.name)
            item.save
          end
        end
      end
      #もし同じアイテムが検索されたらそのアイテムのidを取得する必要がある
    end
  end

  def create
    @item = Item.find(params[:format])
    @post_item = PostItem.new(post_id: @post.id, item_id: @item.id)
    binding.pry
    if @post_item.save
      binding.pry
      redirect_to post_path(@post.id)
      flash[:notice] = "アイテムを登録しました。"
    else
      flash[:alert] = "アイテムの登録に失敗しました."
    end
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

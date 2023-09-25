class ItemsController < ApplicationController
  before_action :set_post
  MAX_POST_ITEMS_COUNT = 3

  def search_items
    @items = []
    @search = params[:keyword]
    if @search
      @results = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
      # @itemsに検索して取得したデータ入れる
      @results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
      # Itemテーブルに同じアイテムがあれば保存しない処理
      @items.each do |item|
        unless Item.all.exists?(name: item.name)
          item.save
        end
      end
    end

    @items = Kaminari.paginate_array(@items).page(params[:page]).per(9)
    @item_posts = Item.joins(:post_items).group(:item_id).
      order('COUNT(post_items.id) DESC').
      limit(MAX_POST_ITEMS_COUNT)
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
      item_url: item_url,
    }
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

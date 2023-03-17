class ItemsController < ApplicationController
  before_action :set_post

  def search_items
    @items = []
    @search = params[:keyword]
    if @search
      @results = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword], hits: 20)
      # @itemsに検索して取得したデータ入れる
      @results.each do |result|
        item = Item.new(read(result))
        @items << item
        # Itemテーブルに同じアイテムがあれば保存しない処理
      end
      @items.each do |item|
        unless Item.all.exists?(name: item.name)
          item.save
        end
      end
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
      item_url: item_url,
    }
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

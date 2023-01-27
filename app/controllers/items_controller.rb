class ItemsController < ApplicationController

  before_action :set_post

  def search_items
    @items = []
    @keyword = params[:keyword]

    if @keyword.present?
      results = RakutenWebService::Ichiba::Product.search(keyword: @keyword, hits: 20)
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end

    @items.each do |item|
      item.save
    end
  end

  private
  def read(result)
    name = result["productName"]
    price = result["averagePrice"]
    image = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    url = result["affiliateUrl"]
    {
      name: name,
      price: price,
      image_url: image,
      item_url: url
    }
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end

class PostItem < ApplicationRecord
  belongs_to :post
  belongs_to :item
  
  validates :post_id, uniqueness: { scope: :item_id }
end

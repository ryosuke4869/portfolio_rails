class Post < ApplicationRecord
  belongs_to :user
  has_many :post_category
  has_many :likes
  has_one_attached :desk_image
end

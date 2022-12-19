class Post < ApplicationRecord
  belongs_to :user

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  has_many_attached :desk_images

end

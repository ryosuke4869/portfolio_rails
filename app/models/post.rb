class Post < ApplicationRecord
  belongs_to :user

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  has_many :likes, dependent: :destroy

  has_many_attached :desk_images

  #いいね機能のアソシエーション処理
  has_many :likes, dependent: :destroy
  has_many :likes_posts, through: :like, source: :user


end

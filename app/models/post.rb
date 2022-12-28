class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :desk_images
  #カテゴリ機能のアソシエーション
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories


  #いいね機能のアソシエーション処理
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  #コメント機能のアソシエーション
  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :user


end

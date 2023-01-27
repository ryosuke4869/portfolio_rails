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
  has_many :comment_users, through: :comments, source: :user

  #ブックマーク機能のアソシエーション
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user


  has_many :items, through: :post_items
  has_many :post_items, dependent: :destroy

end

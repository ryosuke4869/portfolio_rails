class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :desk_images
  # カテゴリ機能のアソシエーション
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  # いいね機能のアソシエーション処理
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  # コメント機能のアソシエーション
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user

  # ブックマーク機能のアソシエーション
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  has_many :post_items, dependent: :destroy
  has_many :items, through: :post_items

  validates :description, presence: true
  validates :desk_images, presence: { message: "を添付してください" },
                          content_type: { in: [:png, :jpg, :jpeg], message: "はpng, jpg, jpegいずれかの形式にして下さい" },
                          limit: { min: 1, max: 5, message: "は5枚まで投稿できます。" },
                          size: { between: 1.kilobyte..5.megabytes, message: 'は5MBより小さい値にしてください' }

  # seed_fuしなおすとvalidateに引っかかるので後で修正
  # validates :category_ids, presence: { message: 'は１つ以上選択してください。' }


  # ransackでソートに使用できる属性追加
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "likes_count", "bookmarks_count"]
  end

end
